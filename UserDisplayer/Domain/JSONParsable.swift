//
//  JSONParsable.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

protocol JSONParsable {
    static func fromJSON(json: JSONDictionary) -> Self?
}
