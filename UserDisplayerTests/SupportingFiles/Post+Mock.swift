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
    
    static var user1MockPost1: Post {
        return Post(userId: 1, id: 1, title: "Post 1", body: "This is test body of a post 1")
    }
    
    static var user1MockPost2: Post {
        return Post(userId: 1, id: 2, title: "Post 2", body: "This is test body of a post 2")
    }
}
