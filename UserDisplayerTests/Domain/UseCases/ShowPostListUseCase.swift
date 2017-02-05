//
//  ShowPostListUseCase.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class ShowPostListUseCaseTests: XCTestCase {
    
    var entityGateway: EntityGatewayMock!
    var useCase: ShowPostListUseCase!
    var result = [PostDisplayData]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        entityGateway = EntityGatewayMock()
        useCase = ShowPostListUseCase(user: UserDisplayData.mock1, entityGateway: entityGateway) { posts in
            self.result = posts
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
        entityGateway.posts = [Post.user1MockPost1]
        useCase.execute()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result[0], PostDisplayData.user1MockPost1)
    }
    
    func testTransformTwoUsersToDisplayData() {
        entityGateway.posts = [Post.user1MockPost1, Post.user1MockPost2]
        useCase.execute()
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], PostDisplayData.user1MockPost1)
        XCTAssertEqual(result[1], PostDisplayData.user1MockPost2)
    }
    
    // MARK: - Mocks
    
    class EntityGatewayMock: EntityGateway {
        
        var posts = [Post]()
        
        func getUsers(completion: @escaping (Result<[User], Error>) -> Void) { }
        
        func getPosts(forUserId id: Int, completion: @escaping (Result<[Post], Error>) -> Void) {
            completion(.success(posts))
        }
    }
}
