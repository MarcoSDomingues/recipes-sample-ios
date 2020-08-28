//
//  LoadingIndicatorCell.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class LoadingIndicatorCell: UICollectionViewCell {
    
    // MARK: -
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = Colors.primary
        view.startAnimating()
        return view
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
        addSubview(activityIndicatorView)
    }
    
    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.frame = bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        activityIndicatorView.startAnimating()
    }
    
}
