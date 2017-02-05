//
//  ApiEndpoint.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

enum ApiEndpoint {
    case users
    case posts(userId: Int?)
    
    static let apiUrl = URL(string: "http://jsonplaceholder.typicode.com")!
    
    var url: URL {
        switch self {
        case .users:
            return ApiEndpoint.apiUrl.appendingPathComponent("users")
        case .posts(let userId):
            if let userId = userId {
                var components = URLComponents(url: ApiEndpoint.apiUrl, resolvingAgainstBaseURL: true)!
                components.path = "/posts"
                components.query = "userId=\(userId)"
                return components.url!
            } else {
                return ApiEndpoint.apiUrl.appendingPathComponent("posts")
            }
        }
    }
    
}
