//
//  Post+Mock.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation
@testable import UserDisplayer

extension Post {
    
    static var user1Posts: [Post] {
        return [
            Post(userId: 1, id: 1, title: "Post 1", body: "This is test body of a post 1"),
            Post(userId: 1, id: 2, title: "Post 2", body: "This is test body of a post 2")
        ]
    }
    
    static var user2Posts: [Post] {
        return [
            Post(userId: 2, id: 3, title: "Post 3", body: "This is test body of a post 3"),
            Post(userId: 2, id: 4, title: "Post 4", body: "This is test body of a post 4"),
        ]
    }
}
