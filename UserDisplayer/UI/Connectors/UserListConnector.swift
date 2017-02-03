//
//  UserListConnector.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

protocol Connector {
    func createInitialController() -> UIViewController
}

class UserListConnector: Connector {
    
    func createInitialController() -> UIViewController {
        let presenter = UserListPresenter()
        let viewController = UserListViewController(presenter: presenter, connector: self)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
