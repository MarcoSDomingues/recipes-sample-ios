//
//  RecipeDetailRouter.swift
//  Recipes
//
//  Created by Marco Domingues on 26/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipeDetailRouter {
    
    let view: RecipeDetailViewController
    let interactor: RecipeDetailInteractor
    let presenter: RecipeDetailPresenter
    
    var navigationController: UINavigationController?
    
    init(view: RecipeDetailViewController, interactor: RecipeDetailInteractor, presenter: RecipeDetailPresenter, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = interactor
        self.presenter = presenter
        self.navigationController = navigationController
    }
    
}

extension RecipeDetailRouter: RecipeDetailNavigator {
    
    // MARK: - RecipeDetailNavigator
    
}
