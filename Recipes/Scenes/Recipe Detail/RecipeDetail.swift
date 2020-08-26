//
//  RecipeDetail.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

protocol RecipeDetailModuleDelegate: class {
}

// MARK: Navigation Layer

protocol RecipeDetailNavigator: class {
}

// MARK: User Layer

protocol RecipeDetailUserInterface: class {
}

protocol RecipeDetailEventHandler: class {
    func viewIsReady()
}

// MARK: Business Layer

protocol RecipeDetailBusinessInteractor: class {
}

protocol RecipeDetailBusinessPresenter: class {
}
