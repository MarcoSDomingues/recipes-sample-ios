//
//  UICollectionViewCell+ReuseIdentifier.swift
//  RecipesUIKit
//
//  Created by Marco Domingues on 27/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static func register(in collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! Self
    }
    
}
