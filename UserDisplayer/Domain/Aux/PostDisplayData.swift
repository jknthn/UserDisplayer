//
//  PostDisplayData.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct PostDisplayData: Equatable {
    
    let id: Int
    let userName: String
    let title: String
    let body: String
    
    // MARK: - Equatable
    
    static func ==(lhs: PostDisplayData, rhs: PostDisplayData) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.userName != rhs.userName { return false }
        if lhs.title != rhs.title { return false }
        if lhs.body != rhs.body { return false }
        return true
    }
}
