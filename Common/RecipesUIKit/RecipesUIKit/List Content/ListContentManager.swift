//
//  ListContentManager.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco. All rights reserved.
//

import UIKit

open class ListContentManager: NSObject {
    
    // MARK: - Properties
    
    public weak var managedCollectionView: UICollectionView! {
        didSet {
            managedCollectionView.delegate = self
            managedCollectionView.dataSource = self
            managedCollectionView.reloadData()
            
            configureContexts()
        }
    }
    
    public var sections: [ListSectionManager] = [] {
        didSet {
            configureContexts()
        }
    }
    
    // MARK: - Configuration
    
    open func configureContexts() {
        sections.enumerated().forEach {
            if let collectionView = managedCollectionView {
                $0.element.registerReuseIdentifiers(in: collectionView)
            }
            
            $0.element.contentContext = ListContentContext(self, sectionIndex: $0.offset)
        }
    }
    
}

extension ListContentManager: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].sizeForItemAt(indexPath.item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[section].sectionInset()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].shouldSelectItemAt(indexPath.item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        sections[indexPath.section].didSelectItemAt(indexPath.item)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        sections[indexPath.section].didDeselectItemAt(indexPath.item)
    }
    
}

extension ListContentManager: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[section].numberOfItems()
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == managedCollectionView else {
            fatalError("UICollectionView not managed by \(self)")
        }
        return sections[indexPath.section].cellForItemAt(indexPath.item)
    }
    
}
