//
//  UseCaseFactory.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class UseCaseFactory {
    
    private let entityGateway: EntityGateway
    
    enum Use {
        case showUserList(completion: ShowUserListCompletion)
        case showPostList(user: UserDisplayData, completion: ShowPostListCompletion)
    }
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Factory
    
    func create(useCase: Use) -> UseCase {
        switch useCase {
        case .showUserList(let completion):
            return ShowUserListUseCase(entityGateway: entityGateway, completion: completion)
        case .showPostList(let user, let completion):
            return ShowPostListUseCase(user: user, entityGateway: entityGateway, completion: completion)
        }
    }

}
