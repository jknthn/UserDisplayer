//
//  User.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct User: Equatable, JSONParsable {
    
    let id: Int
    let name: String
    let userName: String
    let email: String
    
    // MARK: - Equatable
    
    static func ==(lhs: User, rhs: User) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.name != rhs.name { return false }
        if lhs.userName != rhs.userName { return false }
        if lhs.email != rhs.email { return false }
        return true
    }
    
    // MARK: - JSONParsable
    
    static func fromJSON(json: JSONDictionary) -> User? {
        guard
            let id = json["id"] as? Int,
            let name = json["name"] as? String,
            let userName = json["username"] as? String,
            let email = json["email"] as? String
        else {
            return nil
        }
        return User(id: id, name: name, userName: userName, email: email)
    }
    
}
