//
//  PostDisplayData+Mock.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation
@testable import UserDisplayer

extension PostDisplayData {
    
    static var user1MockPost1: PostDisplayData {
        return PostDisplayData(id: 1, userName: "John123", title: "Post 1", body: "This is test body of a post 1")
    }
    
    static var user1MockPost2: PostDisplayData {
        return PostDisplayData(id: 2, userName: "John123", title: "Post 2", body: "This is test body of a post 2")
    }
}
