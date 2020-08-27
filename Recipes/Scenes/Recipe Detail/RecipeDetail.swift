//
//  RecipeDetail.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

protocol RecipeDetailModule: class {
}

protocol RecipeDetailModuleDelegate: class {
    func recipeDetailModuleDidFinish(_ module: RecipeDetailModule)
}

// MARK: Navigation Layer

protocol RecipeDetailNavigator: class {
    func didFinish()
    func navigateToStartCooking()
    func navigateToShareRecipe(_ recipe: RecipeViewModel)
}

// MARK: User Layer

protocol RecipeDetailUserInterface: class {
    func updateView(with recipe: RecipeViewModel)
}

protocol RecipeDetailEventHandler: class {
    func viewIsReady()
    func viewDidTapCloseButton()
    func viewDidTapShareButton()
    func viewDidPressStartCooking()
}

// MARK: Business Layer

protocol RecipeDetailBusinessInteractor: class {
}

protocol RecipeDetailBusinessPresenter: class {
}
