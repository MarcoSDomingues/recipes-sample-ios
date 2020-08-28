//
//  FriendsRepository.swift
//  Recipes
//
//  Created by Marco Domingues on 28/08/2020.
//  Copyright © 2020 Marco Domingues. All rights reserved.
//

import Foundation
import RecipesDomain

final class FriendsRepository: FriendsRepositoryType {
    
    private var friends: [User]
    
    init() {
        self.friends = [
            User(name: "Cristina", info: "Loves screaming", imageName: "cristina-photo", categories: [RecipeCategory(title: "DESSERTS", hexColor: "#FF6379")])
        ]
    }
    
    func fetchFriends(_ completion: @escaping (Result<[User], Error>) -> Void) {
        completion(.success(friends))
    }
    
}
