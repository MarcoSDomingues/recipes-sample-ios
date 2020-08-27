//
//  RecipeDetailRouter.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipeDetailRouter: RecipeDetailModule {
    
    let view: RecipeDetailViewController
    let interactor: RecipeDetailInteractor
    let presenter: RecipeDetailPresenter
    
    var navigationController: UINavigationController?
    
    weak var delegate: RecipeDetailModuleDelegate?
    
    init(view: RecipeDetailViewController, interactor: RecipeDetailInteractor, presenter: RecipeDetailPresenter, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = interactor
        self.presenter = presenter
        self.navigationController = navigationController
        
        navigationController?.pushViewController(view, animated: true)
    }
    
}

extension RecipeDetailRouter: RecipeDetailNavigator {
    
    // MARK: - RecipeDetailNavigator
    
    func didFinish() {
        delegate?.recipeDetailModuleDidFinish(self)
    }
    
    func navigateToShare() {
        // TODO:
    }
    
}
