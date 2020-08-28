//
//  FriendCell.swift
//  Recipes
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    enum Constants {
        static let spacing: CGFloat = 10.0
        static let categoriesHeight: CGFloat = 30.0
        static let margins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: - Properties
    
    var model: UserViewModel? {
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
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
        stackView.addArrangedSubview(UIView())
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
        
        let height = Constants.categoriesHeight
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        RecipeCategoryCell.register(in: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: UserViewModel) {
        collectionView.reloadData()
    }
    
}

extension FriendCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecipeCategoryCell.dequeue(from: collectionView, for: indexPath)
        cell.model = model?.categories[indexPath.item]
        return cell
    }
    
}

extension FriendCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic width
        return CGSize(width: 50, height: collectionView.bounds.height)
    }
    
}
