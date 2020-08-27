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
    let imageName: String
    let categories: [RecipeCategoryViewModel]
    
    init(recipe: Recipe) {
        self.title = recipe.title
        self.imageName = recipe.imageName
        
        self.categories = recipe.categories.map {
            RecipeCategoryViewModel(recipeCategory: $0)
        }
        
    }
    
}
