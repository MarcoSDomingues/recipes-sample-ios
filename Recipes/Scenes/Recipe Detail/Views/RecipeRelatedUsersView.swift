//
//  RecipeRelatedUsersView.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class RecipeRelatedUsersView: UIView {
    
    enum Constants {
        static let spacing: CGFloat = 5
        static let margins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // MARK: - Properties
    
    var model: RecipeViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: -
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = Constants.spacing
        sv.layoutMargins = Constants.margins
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "These users also cooked this dish"
        lbl.font = .systemFont(ofSize: 14)
        lbl.textColor = Colors.white
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(collectionView)
        
        setupCollectionView()
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        RecipeUsersCell.register(in: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: RecipeViewModel) {
        collectionView.reloadData()
    }
    
}

extension RecipeRelatedUsersView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.users.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecipeUsersCell.dequeue(from: collectionView, for: indexPath)
        cell.model = model?.users[indexPath.item]
        return cell
    }
    
}

extension RecipeRelatedUsersView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: height, height: height)
    }
    
}
