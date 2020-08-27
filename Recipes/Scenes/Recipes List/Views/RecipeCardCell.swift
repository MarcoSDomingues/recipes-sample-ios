//
//  RecipeCardCell.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipeCardCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var model: RecipeViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
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
        backgroundColor = .cyan
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: RecipeViewModel) {
        
    }
    
}
