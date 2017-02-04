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
        setupTableView()
        presenter.viewReady()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        presenter.setup(cell: cell, at: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.selectCell(at: indexPath.row)
    }
    
    // MARK: - Private
    
    func setupTableView() {
        tableView.registerCellsWithClass(UserTableViewCell.self)
        tableView.rowHeight = 80.0
        tableView.tableFooterView = UIView()
        tableView.backgroundView = LoadingView()
    }
    
    // MARK: - UserListView
    
    func refresh() {
        tableView.reloadData()
        tableView.backgroundView = nil
    }
    
    func showPosts(forUser user: UserDisplayData) {
        connector.navigateToPostList(forUser: user, fromView: self)
    }
    
}
