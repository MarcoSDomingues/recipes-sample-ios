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
    
    func navigateToShareRecipe(_ recipe: RecipeViewModel) {
        var items: [Any] = [recipe.title, recipe.description]
        
        if let image = UIImage(named: recipe.imageName) {
            items.append(image)
        }
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        view.present(activityViewController, animated: true, completion: nil)
    }
    
    func navigateToStartCooking() {
        let vc = UIAlertController(title: "Cooking", message: "This recipe is being cooked! Wait a minute :)", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        vc.addAction(okButton)
        
        view.present(vc, animated: true)
    }
    
}
