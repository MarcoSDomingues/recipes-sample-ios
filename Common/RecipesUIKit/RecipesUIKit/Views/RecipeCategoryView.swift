//
//  RecipeCategoryView.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

open class RecipeCategoryView: UIView {
    
    enum Constants {
        static let margins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    // MARK: - Properties
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    // MARK: -
    
    internal lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(titleLabel)
        
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        let margins = Constants.margins
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: margins.top),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margins.bottom),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margins.right)
        ])
    }
    
}
