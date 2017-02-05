//
//  ShowUserListUseCaseTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class ShowUserListUseCaseTests: XCTestCase {
    
    var entityGateway: EntityGatewayMock!
    var useCase: ShowUserListUseCase!
    var result = [UserDisplayData]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        entityGateway = EntityGatewayMock()
        useCase = ShowUserListUseCase(entityGateway: entityGateway) { users in
            self.result = users
        }
    }
    
    override func tearDown() {
        entityGateway = nil
        useCase = nil
        result = []
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testWithNoData() {
        useCase.execute()
        XCTAssertEqual(result.count, 0)
    }
    
    func testTransformOneUserToDisplayData() {
        entityGateway.users = [User.mock1]
        useCase.execute()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], UserDisplayData.mock1)
    }
    
    func testTransformTwoUsersToDisplayData() {
        entityGateway.users = [User.mock1, User.mock2]
        useCase.execute()
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], UserDisplayData.mock1)
        XCTAssertEqual(result[1], UserDisplayData.mock2)
    }
    
    // MARK: - Mocks
    
    class EntityGatewayMock: EntityGateway {
        
        var users = [User]()
        
        func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
            completion(.success(users))
        }
        
        func getPosts(forUserId id: Int, completion: @escaping (Result<[Post], Error>) -> Void) { }
    }
}
