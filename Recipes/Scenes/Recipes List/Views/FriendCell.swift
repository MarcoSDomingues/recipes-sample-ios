//
//  FriendCell.swift
//  Recipes
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
    
    enum Constants {
        static let spacing: CGFloat = 10.0
        static let categoriesHeight: CGFloat = 30.0
        static let margins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: - Properties
    
    var model: UserViewModel? {
        didSet {
            if let viewModel = model {
                bindViewModel(viewModel)
            }
        }
    }
    
    // MARK: -
    
    lazy var infoStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = Constants.spacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = Constants.spacing
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(stackView)
        stackView.addArrangedSubview(infoStackView)
        stackView.addArrangedSubview(collectionView)
        
        infoStackView.addArrangedSubview(imageView)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(infoLabel)
        
        setupCollectionView()
        setupConstraints()
    }
    
    // MARK: - Layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        let height = Constants.categoriesHeight
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.setRounded()
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
        RecipeCategoryCell.register(in: collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Bindings
    
    private func bindViewModel(_ viewModel: UserViewModel) {
        nameLabel.text = viewModel.name
        infoLabel.text = viewModel.info
        imageView.image = UIImage(named: viewModel.imageName)
        
        collectionView.reloadData()
    }
    
}

extension FriendCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.categories.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = RecipeCategoryCell.dequeue(from: collectionView, for: indexPath)
        cell.model = model?.categories[indexPath.item]
        return cell
    }
    
}

extension FriendCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic width
        return CGSize(width: 50, height: collectionView.bounds.height)
    }
    
}
