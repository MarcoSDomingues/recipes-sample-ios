//
//  RecipesList.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

protocol RecipesListModule: class {
}

protocol RecipesListModuleDelegate: class {
}

// MARK: Navigation Layer

protocol RecipesListNavigator: class {
    func showError(_ error: Error)
    func navigateToRecipeDetail(with recipe: RecipeViewModel)
}

// MARK: User Layer

protocol RecipesListUserInterface: class {
    func isLoading(_ isLoading: Bool)
    func updateNavigationBarTitle(_ title: String)
    func updateFriends(_ friends: [UserViewModel])
    func updateRecipes(_ recipes: [RecipeViewModel])
}

protocol RecipesListEventHandler: class {
    func viewIsReady()
    func viewDidSelectRecipe(_ recipe: RecipeViewModel)
}

// MARK: Business Layer

protocol RecipesListBusinessInteractor: class {
    func fetchRecipes()
    func fetchFriends()
}

protocol RecipesListBusinessPresenter: class {
    func didFetchFriends(_ friends: [User])
    func didFailToFetchFriends(with error: Error)
    
    func didFetchRecipes(_ recipes: [Recipe])
    func didFailToFetchRecipes(with error: Error)
}
