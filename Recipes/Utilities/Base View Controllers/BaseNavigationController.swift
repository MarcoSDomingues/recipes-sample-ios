//
//  BaseNavigationController.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class BaseNavigationController: UINavigationController {
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return self.topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppearance()
    }
    
    private func setupNavigationBarAppearance() {
        navigationBar.prefersLargeTitles = false
        
        navigationBar.tintColor = Colors.white
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = Colors.background
        
        navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: Colors.primary
        ]
    }
    
}
