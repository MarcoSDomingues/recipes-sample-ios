//
//  RecipesSectionManager.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

final class RecipesSectionManager: ListSectionManager {    
    
    enum Constants {
        static let height: CGFloat = 200
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: - Properties
    
    typealias SelectionActionBlock = (RecipeViewModel) -> Void
    var onSelectionActionBlock: SelectionActionBlock?
    
    var recipes: [RecipeViewModel] = [] {
        didSet {
            contentContext.reload()
        }
    }
    
    private var minimumInteritemSpacing: CGFloat {
        guard let layout = contentContext.layout as? UICollectionViewFlowLayout else {
            return 0.0
        }
        return layout.minimumInteritemSpacing
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        RecipeCardCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return Constants.insets
    }
    
    func numberOfItems() -> Int {
        return recipes.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        var width = contentContext.collectionView.bounds.width
        width -= (insets.left + insets.right)
        return CGSize(width: width, height: Constants.height)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as RecipeCardCell
        cell.model = recipes[index]
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return true
    }
    
    func didSelectItemAt(_ index: Int) {
        onSelectionActionBlock?(recipes[index])
    }
    
}

