//
//  RecipesRepository.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

final class RecipesRepository: RecipesRepositoryType {
    
    func fetchRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let recipes = [
            Recipe(title: "",
                   description: "",
                   imageName: "",
                   instructions: [],
                   categories: []),
            
            Recipe(title: "",
                   description: "",
                   imageName: "",
                   instructions: [],
                   categories: []),
            
            Recipe(title: "",
                   description: "",
                   imageName: "",
                   instructions: [],
                   categories: []),
            
            Recipe(title: "",
                   description: "",
                   imageName: "",
                   instructions: [],
                   categories: []),
        ]
        
        completion(.success(recipes))
    }
    
}
