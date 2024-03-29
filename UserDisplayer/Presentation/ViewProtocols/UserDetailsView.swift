//
//  PostListView.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol UserDetailsView: class {
    func update(nameLabel text: String)
    func update(idLabel text: String)
    func refresh()
}
