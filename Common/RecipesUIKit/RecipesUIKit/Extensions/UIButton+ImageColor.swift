//
//  UIButton+ImageColor.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

internal extension UIButton {
    
    func imageWithColor(_ color: UIColor, cornerRadius: CGFloat = 0) -> UIImage? {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            let clipPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
            context.addPath(clipPath)
            context.clip()
            
            context.setFillColor(color.cgColor)
            context.fill(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        } else {
            return nil
        }
    }
    
}
