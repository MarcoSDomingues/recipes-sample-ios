//
//  RecipesList.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

protocol RecipesListModuleDelegate: class {
}

// MARK: Navigation Layer

protocol RecipesListNavigator: class {
}

// MARK: User Layer

protocol RecipesListUserInterface: class {
}

protocol RecipesListEventHandler: class {
    func viewIsReady()
}

// MARK: Business Layer

protocol RecipesListBusinessInteractor: class {
}

protocol RecipesListBusinessPresenter: class {
}
