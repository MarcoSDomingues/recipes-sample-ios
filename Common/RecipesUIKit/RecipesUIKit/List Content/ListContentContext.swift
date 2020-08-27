//
//  ListContentContext.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

public struct ListContentContext<T: ListContentManager> {
    
    private weak var contentManager: T!
    private var sectionIndex: Int
    
    public init(_ contentManager: T, sectionIndex: Int) {
        self.contentManager = contentManager
        self.sectionIndex = sectionIndex
    }
    
    public var collectionView: UICollectionView {
        return contentManager.managedCollectionView
    }
    
    public var layout: UICollectionViewLayout {
        return contentManager.managedCollectionView.collectionViewLayout
    }
    
    public func dequeueReusableCell(withReuseIdentifier identifier: String, for index: Int) -> UICollectionViewCell {
        let indexPath = IndexPath(item: index, section: sectionIndex)
        return contentManager.managedCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    public func dequeueReusableCell<Cell>(for index: Int) -> Cell where Cell: UICollectionViewCell {
        let indexPath = IndexPath(item: index, section: sectionIndex)
        return Cell.dequeue(from: contentManager.managedCollectionView, for: indexPath)
    }
    
    public func reload() {
        let section = IndexSet(integer: sectionIndex)
        contentManager.managedCollectionView.reloadSections(section)
    }
    
}
