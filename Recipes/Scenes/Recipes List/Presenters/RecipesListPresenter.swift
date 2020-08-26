//
//  RecipesListPresenter.swift
//  Recipes
//
//  Created by Marco Domingues on 26/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

class RecipesListPresenter {
    
    weak var navigator: RecipesListNavigator!
    weak var userInterface: RecipesListUserInterface!
    weak var businessInteractor: RecipesListBusinessInteractor!

}

extension RecipesListPresenter: RecipesListEventHandler {
    
    // MARK: - RecipesListEventHandler
    
    func viewIsReady() {
        // TODO:
    }
    
}

extension RecipesListPresenter: RecipesListBusinessPresenter {
    
    // MARK: - RecipesListBusinessPresenter
    
}
