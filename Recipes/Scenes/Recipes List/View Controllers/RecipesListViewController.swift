//
//  RecipesListViewController.swift
//  Recipes
//
//  Created by Marco Domingues on 26/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var eventHandler: RecipesListEventHandler!
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        eventHandler.viewIsReady()
    }
    
}

extension RecipesListViewController: RecipesListUserInterface {
    
    // MARK: - RecipesListUserInterface
    
}
