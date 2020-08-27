//
//  UserViewModel.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

struct UserViewModel {
    
    let name: String
    let info: String
    let imageName: String
    let categories: [RecipeCategoryViewModel]
    
    init(user: User) {
        self.name = user.name
        self.info = user.info
        self.imageName = user.imageName
        
        self.categories = user.categories.map {
            RecipeCategoryViewModel(recipeCategory: $0)
        }
    }
    
}
