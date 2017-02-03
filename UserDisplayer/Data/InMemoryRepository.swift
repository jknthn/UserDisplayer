//
//  InMemoryRepository.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class InMemoryRepository: EntityGateway {
    
    // TODO: - For development purposes, delete after API implementation
    
    private let users = [
        User(id: 1, name: "John Doe", userName: "Johnny02", email: "john@email.com"),
        User(id: 2, name: "Jane Doe", userName: "Jane332", email: "jane@email.com"),
    ]
    
    // MARK: - EntityGateway
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion(users)
    }
    
}
