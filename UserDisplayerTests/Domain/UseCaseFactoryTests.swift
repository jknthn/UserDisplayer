//
//  UseCaseFactoryTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class UseCaseFactoryTests: XCTestCase {
    
    var useCaseFactory: UseCaseFactory!
    var entityGateway: EntityGateway!
    var closureWasInvoked = false
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        entityGateway = EntityGatewayMock()
        useCaseFactory = UseCaseFactory(entityGateway: entityGateway)
        closureWasInvoked = false
    }
    
    override func tearDown() {
        useCaseFactory = nil
        entityGateway = nil
        closureWasInvoked = false
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testFactoryCreatesShowUserListUseCase() {
        let useCase = useCaseFactory.create(useCase: .showUserList(completion: { _ in }))
        XCTAssertNotNil(useCase as? ShowUserListUseCase)
    }
    
    func testShowUserListClosureInvoked() {
        let useCase = useCaseFactory.create(useCase: .showUserList(completion: { _ in self.closureWasInvoked = true }))
        useCase.execute()
        XCTAssertTrue(closureWasInvoked)
    }
    
    func testFactoryCreatesShowPostListUseCase() {
        let useCase = useCaseFactory.create(useCase: .showPostList(user: UserDisplayData.mock1, completion: { _ in }))
        XCTAssertNotNil(useCase as? ShowPostListUseCase)
    }
    
    func testShowPostListClosureInvoked() {
        let useCase = useCaseFactory.create(useCase: .showPostList(user: UserDisplayData.mock1, completion: { _ in
            self.closureWasInvoked = true
        }))
        useCase.execute()
        XCTAssertTrue(closureWasInvoked)
    }
    
    // MARK: - Mocks
    
    class EntityGatewayMock: EntityGateway {
        
        func getUsers(completion: @escaping ([User]) -> Void) {
            completion([])
        }
        
        func getPosts(forUserId id: Int, completion: @escaping ([Post]) -> Void) {
            completion([])
        }

    }
}
