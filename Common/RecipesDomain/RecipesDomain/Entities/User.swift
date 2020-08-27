//
//  User.swift
//  RecipesDomain
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

public struct User {
    
    public let name: String
    public let info: String
    public let imageName: String
    public let categories: [RecipeCategory]
    
    public init(name: String, info: String, imageName: String, categories: [RecipeCategory]) {
        self.name = name
        self.info = info
        self.imageName = imageName
        self.categories = categories
    }
    
}
