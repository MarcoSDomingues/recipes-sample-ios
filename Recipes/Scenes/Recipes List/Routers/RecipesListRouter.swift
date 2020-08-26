//
//  RecipesListRouter.swift
//  Recipes
//
//  Created by Marco Domingues on 26/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipesListRouter {
    
    let view: RecipesListViewController
    let interactor: RecipesListInteractor
    let presenter: RecipesListPresenter
    
    var navigationController: UINavigationController?
    
    init(view: RecipesListViewController, interactor: RecipesListInteractor, presenter: RecipesListPresenter, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = interactor
        self.presenter = presenter
        self.navigationController = navigationController
        
        navigationController?.pushViewController(view, animated: true)
    }
    
}

extension RecipesListRouter: RecipesListNavigator {
    
    // MARK: - RecipesListNavigator
    
}
