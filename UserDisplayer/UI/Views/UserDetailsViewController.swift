//
//  PostListViewController.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class UserDetailsViewController: UITableViewController, UserDetailsView {
    
    private let connector: UserDetailsConnector
    private let presenter: UserDetailsPresenter
    
    // MARK: - Initialization
    
    init(presenter: UserDetailsPresenter, connector: UserDetailsConnector) {
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
        title = "Posts"
        setupTableView()
        presenter.viewReady()
    }
    
    // MARK: - Private
    
    func setupTableView() {
        tableView.registerCellsWithClass(UserTableViewCell.self)
        tableView.rowHeight = 80.0
        tableView.tableFooterView = UIView()
        tableView.backgroundView = LoadingView()
    }
    
    // MARK: - UserDetailsView
}
