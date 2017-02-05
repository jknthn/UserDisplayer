//
//  UserDetailsPresenterTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class UserDetailsPresenterTests: XCTestCase {
    
    var presenter: UserDetailsPresenter!
    
    var data = [PostDisplayData]()
    
    // MARK: - Mocks
    
    class PostCellMock: PostCell {
        
        var title = ""
        var id = ""
        var user = ""
        var body = ""
        
        func update(id: String) {
            self.id = id
        }

        func update(user: String) {
            self.user = user
        }
        
        func update(title: String) {
            self.title = title
        }
        
        func update(body: String) {
            self.body = body
        }
    }
    
    class EntityGatewayMock: EntityGateway {
        
        func getUsers(completion: @escaping ([User]) -> Void) { }
        func getPosts(forUserId id: Int, completion: @escaping ([Post]) -> Void) { }
    }
    
    class UseCaseFactoryMock: UseCaseFactory {
        
        var useCase: ShowPostListUseCaseMock!
        var data = [PostDisplayData]()
        
        override func create(useCase: UseCaseFactory.Use) -> UseCase {
            switch useCase {
            case .showPostList(_, let completion):
                self.useCase = ShowPostListUseCaseMock(completion: completion)
                self.useCase.data = data
                return self.useCase
            default:
                return super.create(useCase: useCase)
            }
        }
        
    }
    
    class ShowPostListUseCaseMock: UseCase {
        
        let completion: ShowPostListCompletion
        var executeWasInvoked = false
        var data = [PostDisplayData]()
        
        init(completion: @escaping ShowPostListCompletion) {
            self.completion = completion
        }
        
        func execute() {
            executeWasInvoked = true
            completion(data)
        }
    }
    
    class UserDetailsViewMock: UserDetailsView {
        
        var refreshWasInvoked = false
        var id = ""
        var name = ""
        
        func refresh() {
            refreshWasInvoked = true
        }
        
        func update(idLabel text: String) {
            id = text
        }
        
        func update(nameLabel text: String) {
            name = text
        }
    }
    
}
