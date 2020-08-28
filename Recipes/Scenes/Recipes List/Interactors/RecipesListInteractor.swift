//
//  RecipesListInteractor.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

class RecipesListInteractor {
    
    let recipesRepository: RecipesRepositoryType
    let friendsRepository: FriendsRepositoryType
    
    weak var businessPresenter: RecipesListBusinessPresenter!
    
    init(recipesRepository: RecipesRepositoryType, friendsRepository: FriendsRepositoryType) {
        self.recipesRepository = recipesRepository
        self.friendsRepository = friendsRepository
    }
    
}

extension RecipesListInteractor: RecipesListBusinessInteractor {

    // MARK: - RecipesListBusinessInteractor
    
    func fetchRecipes() {
        recipesRepository.fetchRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                self?.businessPresenter.didFetchRecipes(recipes)
            case .failure(let error):
                self?.businessPresenter.didFailToFetchRecipes(with: error)
            }
        }
    }
    
    func fetchRecipes(for query: String) {
        recipesRepository.fetchRecipes(for: query) { [weak self] result in
            switch result {
            case .success(let recipes):
                self?.businessPresenter.didFetchRecipes(recipes)
            case .failure(let error):
                self?.businessPresenter.didFailToFetchRecipes(with: error)
            }
        }
    }
    
    func fetchFriends() {
        friendsRepository.fetchFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.businessPresenter.didFetchFriends(friends)
            case .failure(let error):
                self?.businessPresenter.didFailToFetchFriends(with: error)
            }
        }
    }
}
