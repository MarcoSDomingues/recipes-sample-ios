//
//  RecipeCategory.swift
//  RecipesDomain
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

public struct RecipeCategory {
    
    public let title: String
    public let hexColor: String
    
    public init(title: String, hexColor: String) {
        self.title = title
        self.hexColor = hexColor
    }
    
}
