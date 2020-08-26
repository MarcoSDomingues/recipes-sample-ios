//
//  AppDelegate.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private(set) var router: RecipesListRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRouter()
        
        return true
    }

}

// MARK: - Router

extension AppDelegate {
    
    private func setupRouter() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let builder = RecipesListBuilder()
        self.router = builder.makeModule(with: window, navigationController: BaseNavigationController())
    }
    
}
