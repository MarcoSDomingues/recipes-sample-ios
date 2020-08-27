//
//  Recipe.swift
//  RecipesDomain
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

public struct Recipe {
    
    public let title: String
    public let description: String
    public let imageName: String
    public let instructions: [String]
    public let categories: [RecipeCategory]
    public let users: [User]
    
    public init(title: String, description: String, imageName: String, instructions: [String], categories: [RecipeCategory], users: [User] = []) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.instructions = instructions
        self.categories = categories
        self.users = users
    }
    
}
