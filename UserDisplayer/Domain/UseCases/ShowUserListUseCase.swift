//
//  ShowUserListUseCase.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias ShowUserListCompletion = ([User]) -> Void

class ShowUserListUseCase: UseCase {
    
    private let entityGateway: EntityGateway
    private let completion: ShowUserListCompletion
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway, completion: @escaping ShowUserListCompletion) {
        self.entityGateway = entityGateway
        self.completion = completion
    }
    
    // MARK: - UseCase
    
    func execute() {
        entityGateway.getUsers(completion: completion)
    }
}
