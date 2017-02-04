//
//  UserListConnector.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class UserListConnector: Connector {
    
    private let entityGateway: EntityGateway
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway) {
        self.entityGateway = entityGateway
    }
    
    // MARK: - Connector
    
    func createInitialController() -> UIViewController {
        let factory = UseCaseFactory(entityGateway: entityGateway)
        let presenter = UserListPresenter(useCaseFactory: factory)
        let viewController = UserListViewController(presenter: presenter, connector: self)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    // MARK: - Public
    
    func navigateToPostList(forUser user: UserDisplayData, fromView view: UserListViewController) {
        let postListConnector = UserDetailsConnector(entityGateway: entityGateway, user: user)
        let viewController = postListConnector.createInitialController()
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
