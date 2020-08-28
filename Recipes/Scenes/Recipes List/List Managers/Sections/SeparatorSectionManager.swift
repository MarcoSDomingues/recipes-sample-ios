//
//  SeparatorSectionManager.swift
//  Recipes
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

final class SeparatorSectionManager: ListSectionManager {
    
    enum Constants {
        static let insets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    // MARK: - Properties
    
    private var minimumInteritemSpacing: CGFloat {
        guard let layout = contentContext.layout as? UICollectionViewFlowLayout else {
            return 0.0
        }
        return layout.minimumInteritemSpacing
    }
    
    private let height: CGFloat
    
    init(height: CGFloat = 1) {
        self.height = height
    }
    
    // MARK: - ListSectionManager
    
    var contentContext: ListContentContext<ListContentManager>!
    
    func registerReuseIdentifiers(in collectionView: UICollectionView) {
        SeparatorCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return Constants.insets
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        var width = contentContext.collectionView.bounds.width
        width -= (insets.left + insets.right)
        return CGSize(width: width, height: height)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        return contentContext.dequeueReusableCell(for: index) as SeparatorCell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
}

