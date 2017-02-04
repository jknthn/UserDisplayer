//
//  PostListViewController.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController, UserDetailsView, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80.0
        tableView.tableFooterView = UIView()
        tableView.backgroundView = LoadingView()
        tableView.allowsSelection = false
        return tableView
    }()
    
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
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupAutolayout()
        view.backgroundColor = .white
        title = presenter.title
        presenter.viewReady()
    }
    
    // MARK: - Private
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    func setupAutolayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title"
    }
    
    // MARK: - UserDetailsView
    
    func refresh() {
        tableView.reloadData()
        tableView.backgroundView = nil
    }
}
