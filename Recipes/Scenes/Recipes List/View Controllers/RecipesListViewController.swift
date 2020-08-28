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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var contentManager: RecipesListManager?
    
    lazy var searchController: UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentManager()
        setupSearchController()
        setupCollectionView()
        eventHandler.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.keyboardDismissMode = .onDrag
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupContentManager() {
        contentManager = RecipesListManager(delegate: self)
        contentManager?.managedCollectionView = collectionView
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search anything, find everything..."
    }
    
}

extension RecipesListViewController: RecipesListUserInterface {
    
    // MARK: - RecipesListUserInterface
    
    func updateNavigationBarTitle(_ title: String) {
        self.title = title
    }
    
    func isLoading(_ isLoading: Bool) {
        contentManager?.isLoading = isLoading
    }
    
    func updateRecipes(_ recipes: [RecipeViewModel]) {
        contentManager?.recipes = recipes
    }
    
    func updateFriends(_ friends: [UserViewModel]) {
        contentManager?.friends = friends
    }
    
}

extension RecipesListViewController: RecipesListManagerDelegate {
    
    func recipesListManager(_ listManager: RecipesListManager, didSelect recipe: RecipeViewModel) {
        searchController.dismiss(animated: false)
        eventHandler.viewDidSelectRecipe(recipe)
    }
    
}

extension RecipesListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        eventHandler.searchBarTextDidChange(with: searchText)
    }
    
}
