//
//  PostCell.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol PostCell {
    func update(id: String)
    func update(title: String)
    func update(body: String)
    func update(user: String)
}
