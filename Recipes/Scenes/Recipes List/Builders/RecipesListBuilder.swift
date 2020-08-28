//
//  RecipesListBuilder.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesDomain

class RecipesListBuilder {
    
    let recipesRepository: RecipesRepositoryType
    let friendsRepository: FriendsRepositoryType
    
    init(recipesRepository: RecipesRepositoryType = RecipesRepository(),
         friendsRepository: FriendsRepositoryType = FriendsRepository()) {
        self.recipesRepository = recipesRepository
        self.friendsRepository = friendsRepository
    }
    
    func makeModule(with window: UIWindow?, navigationController: UINavigationController? = nil) -> RecipesListRouter {
        let view = makeView()
        let interactor = makeInteractor()
        let presenter = makePresenter()
        let router = makeRouter(
            view: view,
            interactor: interactor,
            presenter: presenter,
            navigationController: navigationController)
        
        connect(view: view, interactor: interactor, presenter: presenter, router: router)
        
        window?.rootViewController = navigationController ?? view
        window?.makeKeyAndVisible()
        
        return router
    }
    
    private func makeView() -> RecipesListViewController {
        RecipesListViewController()
    }
    
    private func makeInteractor() -> RecipesListInteractor {
        RecipesListInteractor(recipesRepository: recipesRepository,
                              friendsRepository: friendsRepository)
    }
    
    private func makePresenter() -> RecipesListPresenter {
        RecipesListPresenter()
    }
    
    private func makeRouter(view: RecipesListViewController, interactor: RecipesListInteractor, presenter: RecipesListPresenter, navigationController: UINavigationController?) -> RecipesListRouter {
        RecipesListRouter(view: view,
                          interactor: interactor,
                          presenter: presenter,
                          navigationController: navigationController)
    }
    
    private func connect(view: RecipesListViewController, interactor: RecipesListInteractor, presenter: RecipesListPresenter, router: RecipesListRouter) {
        presenter.navigator = router
        presenter.userInterface = view
        presenter.businessInteractor = interactor
        view.eventHandler = presenter
        interactor.businessPresenter = presenter
    }
    
}
