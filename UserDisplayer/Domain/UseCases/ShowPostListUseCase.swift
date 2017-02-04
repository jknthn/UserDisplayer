//
//  ShowPostListUseCase.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias ShowPostListCompletion = ([PostDisplayData]) -> Void

class ShowPostListUseCase: UseCase {
    
    private let user: UserDisplayData
    private let entityGateway: EntityGateway
    private let completion: ShowPostListCompletion
    
    // MARK: - Initialization
    
    init(user: UserDisplayData, entityGateway: EntityGateway, completion: @escaping ShowPostListCompletion) {
        self.user = user
        self.entityGateway = entityGateway
        self.completion = completion
    }
    
    // MARK: - UseCase
    
    func execute() {
        entityGateway.getPosts(forUserId: user.id) { posts in
            let displayData = posts.map { PostDisplayData(id: $0.id, userName: self.user.userName, title: $0.title, body: $0.body) }
            self.completion(displayData)
        }
    }
}
