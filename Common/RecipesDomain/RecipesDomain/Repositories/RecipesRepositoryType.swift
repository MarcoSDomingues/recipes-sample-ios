//
//  RecipesRepositoryType.swift
//  RecipesDomain
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

public protocol RecipesRepositoryType {
    func fetchRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
    func fetchRecipes(for query: String, completion: @escaping (Result<[Recipe], Error>) -> Void)
}
