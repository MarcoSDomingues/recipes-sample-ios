//
//  LoadingSectionManager.swift
//  Recipes
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

final class LoadingSectionManager: ListSectionManager {
    
    enum Constants {
        static let height: CGFloat = 40.0
    }
    
    // MARK: - Properties
    
    var isLoading: Bool = false {
        didSet {
            contentContext.reload()
        }
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        LoadingIndicatorCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return .zero
    }
    
    func numberOfItems() -> Int {
        return isLoading ? 1 : 0
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        let width = contentContext.collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: Constants.height)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        return contentContext.dequeueReusableCell(for: index) as LoadingIndicatorCell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
}
