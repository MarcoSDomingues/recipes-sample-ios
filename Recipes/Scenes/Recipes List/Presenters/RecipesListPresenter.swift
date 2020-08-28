//
//  RecipesListPresenter.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

class RecipesListPresenter {
    
    weak var navigator: RecipesListNavigator!
    weak var userInterface: RecipesListUserInterface!
    weak var businessInteractor: RecipesListBusinessInteractor!

}

extension RecipesListPresenter: RecipesListEventHandler {
    
    // MARK: - RecipesListEventHandler
    
    func viewIsReady() {
        userInterface.updateNavigationBarTitle("DISCOVERY")
        
        businessInteractor.fetchFriends()
        
        userInterface.isLoading(true)
        businessInteractor.fetchRecipes()
    }
    
    func viewDidSelectRecipe(_ recipe: RecipeViewModel) {
        navigator.navigateToRecipeDetail(with: recipe)
    }
    
}

extension RecipesListPresenter: RecipesListBusinessPresenter {
    
    // MARK: - RecipesListBusinessPresenter
    
    func didFetchFriends(_ friends: [User]) {
        let friends = friends.map { UserViewModel(user: $0) }
        userInterface.updateFriends(friends)
    }
    
    func didFailToFetchFriends(with error: Error) {
        navigator.showError(error)
    }
    
    func didFetchRecipes(_ recipes: [Recipe]) {
        userInterface.isLoading(false)
        
        let recipes = recipes.map { RecipeViewModel(recipe: $0) }
        userInterface.updateRecipes(recipes)
    }
    
    func didFailToFetchRecipes(with error: Error) {
        userInterface.isLoading(false)
        navigator.showError(error)
    }
    
}
