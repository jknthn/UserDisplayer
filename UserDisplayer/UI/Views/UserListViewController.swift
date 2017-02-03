//
//  UserListViewController.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController, UserListView {
    
    private let connector: UserListConnector
    private let presenter: UserListPresenter
    
    // MARK: - Initialization
    
    init(presenter: UserListPresenter, connector: UserListConnector) {
        self.presenter = presenter
        self.connector = connector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UserListView
    
    func refresh() {
        tableView.reloadData()
    }
    
}
