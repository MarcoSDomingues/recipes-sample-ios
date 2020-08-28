//
//  FriendsRepositoryType.swift
//  RecipesDomain
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation

public protocol FriendsRepositoryType {
    func fetchFriends(_ completion: @escaping (Result<[User], Error>) -> Void)
}
