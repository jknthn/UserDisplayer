//
//  UserDisplayData.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct UserDisplayData: Equatable {
    
    let id: Int
    let name: String
    let userName: String
    let email: String
    
    // MARK: - Equatable
    
    static func ==(lhs: UserDisplayData, rhs: UserDisplayData) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.name != rhs.name { return false }
        if lhs.userName != rhs.userName { return false }
        if lhs.email != rhs.email { return false }
        return true
    }
}
