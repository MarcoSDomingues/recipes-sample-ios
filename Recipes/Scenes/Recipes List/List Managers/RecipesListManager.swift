//
//  RecipesListManager.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import RecipesUIKit

protocol RecipesListManagerDelegate: class {
    func recipesListManager(_ listManager: RecipesListManager, didSelect recipe: RecipeViewModel)
}

final class RecipesListManager: ListContentManager {
    
    // MARK: - Properties
    
    weak var delegate: RecipesListManagerDelegate?
    
    public var recipes: [RecipeViewModel] {
        get {
            recipesSection.recipes
        } set {
            isLoading = false
            recipesSection.recipes = newValue
        }
    }
    
    public var friends: [UserViewModel] {
        get {
            friendsSection.friends
        } set {
            friendsSection.friends = newValue
        }
    }
    
    public var isLoading: Bool {
        get {
            return loadingSection.isLoading
        } set {
            loadingSection.isLoading = newValue
        }
    }
    
    private var friendsSection: FriendsSectionManager
    private var recipesSection: RecipesSectionManager
    private var loadingSection: LoadingSectionManager
    private var separatorSection: SeparatorSectionManager
    
    // MARK: - Initialization
    
    init(delegate: RecipesListManagerDelegate? = nil) {
        self.delegate = delegate
        
        friendsSection = FriendsSectionManager()
        loadingSection = LoadingSectionManager()
        recipesSection = RecipesSectionManager()
        separatorSection = SeparatorSectionManager()
        
        super.init()
        
        sections = [friendsSection, separatorSection, recipesSection, loadingSection]
        
        recipesSection.onSelectionActionBlock = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.recipesListManager(self, didSelect: $0)
        }
    }
    
}
