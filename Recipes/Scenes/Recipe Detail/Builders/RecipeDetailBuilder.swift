//
//  RecipeDetailBuilder.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipeDetailBuilder {
    
    let recipe: RecipeViewModel
    
    init(recipe: RecipeViewModel) {
        self.recipe = recipe
    }
    
    func makeModule(with navigationController: UINavigationController?) -> RecipeDetailRouter {
        let view = makeView()
        let interactor = makeInteractor()
        let presenter = makePresenter()
        let router = makeRouter(
            view: view,
            interactor: interactor,
            presenter: presenter,
            navigationController: navigationController)
        
        connect(view: view, interactor: interactor, presenter: presenter, router: router)
        configure(view: view, navigationController: navigationController, presenter: presenter)
        
        return router
    }
    
    private func makeView() -> RecipeDetailViewController {
        RecipeDetailViewController()
    }
    
    private func makeInteractor() -> RecipeDetailInteractor {
        RecipeDetailInteractor()
    }
    
    private func makePresenter() -> RecipeDetailPresenter {
        RecipeDetailPresenter()
    }
    
    private func makeRouter(view: RecipeDetailViewController, interactor: RecipeDetailInteractor, presenter: RecipeDetailPresenter, navigationController: UINavigationController?) -> RecipeDetailRouter {
        RecipeDetailRouter(view: view,
                           interactor: interactor,
                           presenter: presenter,
                           navigationController: navigationController)
    }
    
    private func connect(view: RecipeDetailViewController, interactor: RecipeDetailInteractor, presenter: RecipeDetailPresenter, router: RecipeDetailRouter) {
        presenter.navigator = router
        presenter.userInterface = view
        presenter.businessInteractor = interactor
        view.eventHandler = presenter
        interactor.businessPresenter = presenter
    }
    
    private func configure(view: RecipeDetailViewController, navigationController: UINavigationController?, presenter: RecipeDetailPresenter) {
        view.modalPresentationStyle = .fullScreen
        navigationController?.modalPresentationStyle = .fullScreen
        presenter.configure(with: recipe)
    }
    
}
