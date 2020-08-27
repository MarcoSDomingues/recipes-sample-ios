//
//  RecipeCategoryViewModel.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

struct RecipeCategoryViewModel {
    
    let title: String
    let hexColor: String
    
    init(recipeCategory: RecipeCategory) {
        self.title = recipeCategory.title
        self.hexColor = recipeCategory.hexColor
    }
    
}
