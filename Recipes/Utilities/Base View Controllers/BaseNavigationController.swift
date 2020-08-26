//
//  BaseNavigationController.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

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
        
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationBar.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        ]
    }
    
}
