//
//  RecipeCategoryCell.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class RecipeCategoryCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var model: RecipeCategoryViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: -
    
    lazy var categoryView = RecipeCategoryView()
    
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
        addSubview(categoryView)
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: topAnchor),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryView.heightAnchor.constraint(equalToConstant: bounds.height)
        ])
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: RecipeCategoryViewModel) {
        categoryView.title = viewModel.title
        categoryView.backgroundColor = UIColor(hexString: viewModel.hexColor)
    }
    
}
