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
    
    var entityGateway: EntityGateway!
    var useCase: ShowUserListUseCase!
    var result = [User]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        entityGateway = EntityGatewayMock()
        useCase = ShowUserListUseCase(entityGateway: entityGateway) { users in
            self.result = users
        }
        super.setUp()
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
    
    
    
    // MARK: - Mocks
    
    class EntityGatewayMock: EntityGateway {
        
        var users = [User]()
        
        func getUsers(completion: @escaping ([User]) -> Void) { }
    }
}
