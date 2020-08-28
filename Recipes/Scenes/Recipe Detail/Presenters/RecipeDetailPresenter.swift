//
//  RecipeDetailPresenter.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

class RecipeDetailPresenter {
    
    private var recipe: RecipeViewModel!
    weak var navigator: RecipeDetailNavigator!
    weak var userInterface: RecipeDetailUserInterface!
    weak var businessInteractor: RecipeDetailBusinessInteractor!

    func configure(with recipe: RecipeViewModel) {
        self.recipe = recipe
    }
    
}

extension RecipeDetailPresenter: RecipeDetailEventHandler {
    
    // MARK: - RecipesListEventHandler
    
    func viewIsReady() {
        userInterface.updateView(with: recipe)
    }
    
    func viewDidTapCloseButton() {
        navigator.didFinish()
    }
    
    func viewDidTapShareButton() {
        navigator.navigateToShareRecipe(recipe)
    }
    
    func viewDidPressStartCooking() {
        navigator.navigateToStartCooking()
    }
    
}

extension RecipeDetailPresenter: RecipeDetailBusinessPresenter {
    
    // MARK: - RecipesListBusinessPresenter
    
}
