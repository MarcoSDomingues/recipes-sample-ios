//
//  UIView+Rounded.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

public extension UIView {
    
    func setRounded() {
        setCornerRadius(layer.bounds.height / 2)
    }
    
    func setCornerRadius(_ cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
}
