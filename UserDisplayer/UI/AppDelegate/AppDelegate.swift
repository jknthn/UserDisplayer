//
//  AppDelegate.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var rootConnector: Connector = {
        let repo = InMemoryRepository()
        let connector = UserListConnector(entityGateway: repo)
        return connector
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootConnector.createInitialController()
        window?.makeKeyAndVisible()
    }
    
}
