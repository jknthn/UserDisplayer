//
//  ShowUserListUseCase.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias ShowUserListCompletion = ([UserDisplayData]) -> Void

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
        entityGateway.getUsers { result in
            result.onSuccess { users in
                let displayData = users.map { UserDisplayData(id: $0.id, name: $0.name, userName: $0.userName) }
                self.completion(displayData)
            }
            result.onError { _ in
                assertionFailure("Error") // TODO: - Handle error
            }
        }
    }
}
