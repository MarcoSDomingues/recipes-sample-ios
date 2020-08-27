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
    
    let repository: RecipesRepositoryType
    weak var businessPresenter: RecipesListBusinessPresenter!
    
    init(repository: RecipesRepositoryType) {
        self.repository = repository
    }
    
}

extension RecipesListInteractor: RecipesListBusinessInteractor {

    // MARK: - RecipesListBusinessInteractor
    
    func fetchRecipes() {
        repository.fetchRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                self?.businessPresenter.didFetchRecipes(recipes)
            case .failure(let error):
                self?.businessPresenter.didFailToFetchRecipes(with: error)
            }
        }
    }
    
}
