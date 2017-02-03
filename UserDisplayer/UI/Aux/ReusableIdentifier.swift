//
//  ReusableIdentifier.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

protocol ReusableIdentifier: AnyObject {
    static var identifier: String { get }
}

extension ReusableIdentifier {
    
    static var identifier: String {
        return String(describing: self.self)
    }
}

extension UITableViewCell: ReusableIdentifier { }

extension UITableView {
    
    func registerCellsWithClass(_ cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
}
