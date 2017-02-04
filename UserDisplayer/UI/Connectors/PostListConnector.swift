//
//  PostListConnector.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class PostListConnector: Connector {
    
    private let entityGateway: EntityGateway
    private let user: UserDisplayData
    
    // MARK: - Initialization
    
    init(entityGateway: EntityGateway, user: UserDisplayData) {
        self.entityGateway = entityGateway
        self.user = user
    }
    
    // MARK: - Connector
    
    func createInitialController() -> UIViewController {
        let factory = UseCaseFactory(entityGateway: entityGateway)
        let presenter = PostListPresenter(useCaseFactory: factory)
        let viewController = PostListViewController(presenter: presenter, connector: self)
        presenter.view = viewController
        return viewController
    }
}
