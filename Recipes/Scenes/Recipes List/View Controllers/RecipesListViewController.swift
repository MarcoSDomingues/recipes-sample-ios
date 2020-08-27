//
//  RecipesListViewController.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var eventHandler: RecipesListEventHandler!
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        eventHandler.viewIsReady()
    }
    
}

extension RecipesListViewController: RecipesListUserInterface {
    
    // MARK: - RecipesListUserInterface
    
    func updateNavigationBarTitle(_ title: String) {
        self.title = title
    }
    
    func isLoading(_ isLoading: Bool) {
        // TODO: Implement
    }
    
    func updateRecipes(_ recipes: [RecipeViewModel]) {
        // TODO: Implement
    }
    
}
