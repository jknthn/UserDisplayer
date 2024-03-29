//
//  Post.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

struct Post: Equatable, JSONParsable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    // MARK: - Equatable
    
    static func ==(lhs: Post, rhs: Post) -> Bool {
        if lhs.userId != rhs.userId { return false }
        if lhs.id != rhs.id { return false }
        if lhs.title != rhs.title { return false }
        if lhs.body != rhs.body { return false }
        return true
    }
    
    // MARK: - JSONParsable
    
    static func fromJSON(json: JSONDictionary) -> Post? {
        guard
            let userId = json["userId"] as? Int,
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let body = json["body"] as? String
        else {
            return nil
        }
        return Post(userId: userId, id: id, title: title, body: body)
    }
}
