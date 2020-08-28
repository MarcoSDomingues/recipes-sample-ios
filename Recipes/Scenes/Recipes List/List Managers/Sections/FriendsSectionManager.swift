//
//  FriendsSectionManager.swift
//  Recipes
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit
import RecipesUIKit

final class FriendsSectionManager: ListSectionManager {
    
    enum Constants {
        static let height: CGFloat = 60
        static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: - Properties
    
    var friends: [UserViewModel] = [] {
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
        FriendCell.register(in: collectionView)
    }
    
    func sectionInset() -> UIEdgeInsets {
        return Constants.insets
    }
    
    func numberOfItems() -> Int {
        return friends.count
    }
    
    func sizeForItemAt(_ index: Int) -> CGSize {
        let insets = sectionInset()
        var width = contentContext.collectionView.bounds.width
        width -= (insets.left + insets.right)
        return CGSize(width: width, height: Constants.height)
    }
    
    func cellForItemAt(_ index: Int) -> UICollectionViewCell {
        let cell = contentContext.dequeueReusableCell(for: index) as FriendCell
        cell.model = friends[index]
        return cell
    }
    
    func shouldSelectItemAt(_ index: Int) -> Bool {
        return false
    }
    
}
