//
//  Colors.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

public enum Colors {
    
    public static var primary: UIColor {
        return UIColor(named: "primary", in: Bundle.UI, compatibleWith: nil)!
    }
    
    public static var primaryDark: UIColor {
        return UIColor(named: "primaryDark", in: Bundle.UI, compatibleWith: nil)!
    }
    
    public static var text: UIColor {
        return UIColor(named: "text", in: Bundle.UI, compatibleWith: nil)!
    }
    
    public static var white: UIColor {
        return .white
    }
    
    public static var grey: UIColor {
        return UIColor(named: "mercury", in: Bundle.UI, compatibleWith: nil)!
    }
    
    public static var background: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    
}
