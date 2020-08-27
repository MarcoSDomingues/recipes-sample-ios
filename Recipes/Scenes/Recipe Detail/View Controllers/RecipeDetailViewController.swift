//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

class RecipeDetailViewController: UIViewController {
    
    enum Constants {
        static let margin: CGFloat = 20
        static let usersHeight: CGFloat = 50
        static let buttonHeight: CGFloat = 50
    }
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var eventHandler: RecipeDetailEventHandler!
    
    // MARK: -
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        return view
    }()
    
    lazy var detailView = RecipeDetailView()
    lazy var startButton = CTAButton()
    lazy var usersView = RecipeRelatedUsersView()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBarItems()
        eventHandler.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    // MARK: - Setup
    
    private func setupNavigationBarItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon-close"), style: .plain, target: self, action: #selector(didPressCloseButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon-share"), style: .plain, target: self, action: #selector(didPressShareButton))
    }
    
    private func setupView() {
        setupImageView()
        setupOverlayView()
        setupUsersView()
        setupStartCookingButton()
        setupDetailView()
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupOverlayView() {
        view.addSubview(overlayView)
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupDetailView() {
        view.addSubview(detailView)
        
        let margin = Constants.margin
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -margin),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupStartCookingButton() {
        view.addSubview(startButton)
        
        startButton.setTitle("START COOKING", for: .normal)
        startButton.addTarget(self, action: #selector(didPressStartCookingButton), for: .touchUpInside)
        
        let margin = Constants.margin
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: usersView.topAnchor, constant: -margin),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            startButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }
    
    private func setupUsersView() {
        view.addSubview(usersView)
        
        let margin = Constants.margin
        usersView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usersView.heightAnchor.constraint(equalToConstant: Constants.usersHeight),
            usersView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usersView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usersView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin)
        ])
    }
    
    // MARK: Actions
    
    @objc private func didPressCloseButton() {
        eventHandler.viewDidTapCloseButton()
    }
    
    @objc private func didPressShareButton() {
        eventHandler.viewDidTapShareButton()
    }
    
    @objc private func didPressStartCookingButton() {
        eventHandler.viewDidPressStartCooking()
    }
    
}

extension RecipeDetailViewController: RecipeDetailUserInterface {
    
    // MARK: - RecipeDetailUserInterface
    
    func updateView(with recipe: RecipeViewModel) {
        imageView.image = UIImage(named: recipe.imageName)
        detailView.model = recipe
        usersView.model = recipe
        usersView.isHidden = recipe.users.isEmpty
    }
    
}
