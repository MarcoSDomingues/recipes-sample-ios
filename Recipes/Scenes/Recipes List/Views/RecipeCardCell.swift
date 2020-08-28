//
//  RecipeCardCell.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class RecipeCardCell: UICollectionViewCell {
    
    enum Constants {
        static let spacing: CGFloat = 10.0
        static let categoriesHeight: CGFloat = 30.0
        static let margins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
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
    
    lazy var containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .bottom
        sv.layoutMargins = Constants.margins
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = Constants.spacing
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = Colors.grey
        return iv
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 28)
        lbl.textColor = Colors.white
        return lbl
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
        addSubview(imageView)
        addSubview(overlayView)
        
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(collectionView)
        
        setupCollectionView()
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor)
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
    
    private func bindViewModel(_ viewModel: RecipeViewModel) {
        titleLabel.text = viewModel.title
        imageView.image = UIImage(named: viewModel.imageName)
        
        collectionView.reloadData()
    }
    
}

extension RecipeCardCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecipeCategoryCell.dequeue(from: collectionView, for: indexPath)
        cell.model = model?.categories[indexPath.item]
        return cell
    }
    
}

extension RecipeCardCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic width
        return CGSize(width: 50, height: collectionView.bounds.height)
    }
    
}
