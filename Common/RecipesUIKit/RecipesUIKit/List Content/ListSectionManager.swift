//
//  ListSectionManager.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

public protocol ListSectionManager: class {
    var contentContext: ListContentContext<ListContentManager>! { get set }
    func registerReuseIdentifiers(in collectionView: UICollectionView)
    
    func sectionInset() -> UIEdgeInsets
    func numberOfItems() -> Int
    
    func sizeForItemAt(_ index: Int) -> CGSize
    func cellForItemAt(_ index: Int) -> UICollectionViewCell
    
    func shouldSelectItemAt(_ index: Int) -> Bool
    
    func didSelectItemAt(_ index: Int)
    func didDeselectItemAt(_ index: Int)
    
}

// MARK: - Defaults

extension ListSectionManager {
    func didSelectItemAt(_ index: Int) {}
    func didDeselectItemAt(_ index: Int) {}
}
