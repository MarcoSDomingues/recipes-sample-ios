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
    
    private var recipes: [Recipe]
    
    init() {
        self.recipes = [
            Recipe(title: "Carrot Cake",
                   description: "Awesome Carrot Cake!",
                   imageName: "carrot-cake",
                   instructions: ["• 35 min", "• Ingredients serve 6"],
                   categories: [
                    RecipeCategory(title: "DESSERTS", hexColor: "#FF6379"),
                    RecipeCategory(title: "DINNER", hexColor: "#FA8E5F")
                ]
            ),
            
            Recipe(title: "Cherry Icecream",
                   description: "Awesome Cherry Icecream!",
                   imageName: "cherry-icecream",
                   instructions: ["• 20 min", "• Ingredients serve 3"],
                   categories: [
                       RecipeCategory(title: "DESSERTS", hexColor: "#FF6379"),
                       RecipeCategory(title: "FRAPPE", hexColor: "#64B2FA"),
                       RecipeCategory(title: "SNACK", hexColor: "#46D6DE")
                   ]
            ),
            
            Recipe(title: "Lava Chocolate Cake",
                   description: "Awesome Lava Chocolate Cake!",
                   imageName: "chocolate-lava-cake",
                   instructions: ["• 45 min", "• Ingredients serve 4"],
                   categories: [
                       RecipeCategory(title: "DESSERTS", hexColor: "#FF6379"),
                       RecipeCategory(title: "DINNER", hexColor: "#FA8E5F"),
                       RecipeCategory(title: "CHOCOLATE", hexColor: "#FE3D38")
                   ]
            ),
            
            Recipe(title: "Triple Chocolate Cake",
                   description: "Awesome Triple Chocolate Cake!",
                   imageName: "triple-choco-cake",
                   instructions: ["• 50 min", "• Ingredients serve 3"],
                   categories: [
                    RecipeCategory(title: "DESSERTS", hexColor: "#FF6379"),
                    RecipeCategory(title: "FRAPPE", hexColor: "#64B2FA"),
                    RecipeCategory(title: "DINNER", hexColor: "#FA8E5F"),
                    RecipeCategory(title: "CHOCOLATE", hexColor: "#FE3D38")
                ]
            ),
        ]
    }
    
    func fetchRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
        completion(.success(recipes))
    }
    
}
