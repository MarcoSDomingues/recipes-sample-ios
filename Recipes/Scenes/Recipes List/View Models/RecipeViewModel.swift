//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

struct RecipeViewModel {
    
    let title: String
    let description: String
    let imageName: String
    let instructions: [String]
    let categories: [RecipeCategoryViewModel]
    let users: [UserViewModel]
    
    init(recipe: Recipe) {
        self.title = recipe.title
        self.description = recipe.description
        self.imageName = recipe.imageName
        self.instructions = recipe.instructions
        
        self.categories = recipe.categories.map {
            RecipeCategoryViewModel(recipeCategory: $0)
        }
        
        self.users = recipe.users.map {
            UserViewModel(user: $0)
        }
        
    }
    
}
