//
//  UserDisplayData+Mock.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation
@testable import UserDisplayer

extension UserDisplayData {
    
    static func mock1() -> UserDisplayData {
        return UserDisplayData(id: 1, name: "John Doe", userName: "John123")
    }
    
    static func mock2() -> UserDisplayData {
        return UserDisplayData(id: 2, name: "Jane Appleseed", userName: "jane_a")
    }
}
