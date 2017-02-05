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
    // Left for development history
    
    private let users = [
        User(id: 1, name: "John Doe", userName: "Johnny02", email: "john@email.com"),
        User(id: 2, name: "Jane Doe", userName: "Jane332", email: "jane@email.com"),
    ]
    
    private let posts = [
        Post(userId: 1, id: 1, title: "Post 1", body: "This is test body of a post 1"),
        Post(userId: 1, id: 2, title: "Post 2", body: "This is test body of a post 2"),
        Post(userId: 2, id: 3, title: "Post 3", body: "This is test body of a post 3"),
        Post(userId: 2, id: 4, title: "Post 4", body: "This is test body of a post 4"),
    ]
    
    // MARK: - EntityGateway
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion(users)
    }
    
    func getPosts(forUserId id: Int, completion: @escaping ([Post]) -> Void) {
        completion(posts.filter({ $0.userId == id }))
    }
    
}
