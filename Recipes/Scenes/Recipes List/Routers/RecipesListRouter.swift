//
//  RecipesListRouter.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipesListRouter {
    
    let view: RecipesListViewController
    let interactor: RecipesListInteractor
    let presenter: RecipesListPresenter
    
    var navigationController: UINavigationController?
    private(set) var detailRouter: RecipeDetailRouter?
    
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
    
    func showError(_ error: Error) {
        let vc = UIAlertController(title: "Error",
                                   message: error.localizedDescription,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        vc.addAction(okAction)
        
        view.present(vc, animated: true)
    }
    
    func navigateToRecipeDetail(with recipe: RecipeViewModel) {
        let builder = RecipeDetailBuilder(recipe: recipe)
        let router = builder.makeModule(with: navigationController)
        self.detailRouter = router
        navigationController?.pushViewController(router.view, animated: true)
    }
    
}
