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
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupStartCookingButton() {
        view.addSubview(startButton)
        
        startButton.setTitle("START COOKING", for: .normal)
        startButton.addTarget(self, action: #selector(didPressStartCookingButton), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 50)
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
    }
    
}
