//
//  CTAButton.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 30/09/2021.
//  Copyright © 2021 Marco Domingues. All rights reserved.
//

import UIKit

open class CTAButton: UIButton {
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = Colors.primary
    }
    
}
