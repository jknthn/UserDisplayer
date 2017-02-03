//
//  UserDisplayData.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct UserDisplayData: Equatable, Comparable {
    
    let id: Int
    let name: String
    let userName: String
    
    // MARK: - Equatable
    
    static func ==(lhs: UserDisplayData, rhs: UserDisplayData) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.name != rhs.name { return false }
        if lhs.userName != rhs.userName { return false }
        return true
    }
    
    // MARK: - Comparable 
    
    static func <(lhs: UserDisplayData, rhs: UserDisplayData) -> Bool {
        if lhs.name != rhs.name { return lhs.name < rhs.name }
        else { return lhs.userName < rhs.userName }
    }
}
