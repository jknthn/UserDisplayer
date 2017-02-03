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
    
    static var mock1: User {
        return User(id: 1, name: "John Doe", userName: "John123", email: "user@email.com")
    }
    
    static var mock2: User {
        return User(id: 2, name: "Jane Appleseed", userName: "jane_a", email: "jane@email.com")
    }
}
