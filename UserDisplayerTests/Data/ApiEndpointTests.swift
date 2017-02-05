//
//  ApiEndpointTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class ApiEndpointTests: XCTestCase {
    
    private let apiBaseUrlString = "http://jsonplaceholder.typicode.com"
    
    // MARK: - Tests
    
    func testUsersEndpoint() {
        let endpoint = ApiEndpoint.users
        XCTAssertEqual(endpoint.url.absoluteString, apiBaseUrlString + "/users")
    }
    
    func testPostsEndpointNoUser() {
        let endpoint = ApiEndpoint.posts(userId: nil)
        XCTAssertEqual(endpoint.url.absoluteString, apiBaseUrlString + "/posts")
    }
    
    func testPostsEndpointWithId() {
        let endpoint = ApiEndpoint.posts(userId: 1)
        XCTAssertEqual(endpoint.url.absoluteString, apiBaseUrlString + "/posts/1")
    }
}
