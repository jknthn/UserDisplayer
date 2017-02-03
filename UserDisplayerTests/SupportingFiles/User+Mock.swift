//
//  User+Mock.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation
@testable import UserDisplayer

extension User {
    
    static func mock1() -> User {
        return User(id: 1, name: "John Doe", userName: "John123", email: "user@email.com")
    }
    
    static func mock2() -> User {
        return User(id: 2, name: "Jane Appleseed", userName: "jane_a", email: "jane@email.com")
    }
}
