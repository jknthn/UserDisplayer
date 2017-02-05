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
        tableView.registerCellsWithClass(PostTableViewCell.self)
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        tableView.backgroundView = LoadingView()
        tableView.allowsSelection = false
        return tableView
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
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
        showNetworkActivityIndicator()
        setupStackViews()
        setupTableView()
        setupAutolayout()
        view.backgroundColor = .white
        title = presenter.title
        presenter.viewReady()
    }
    
    // MARK: - Private
    
    func setupStackViews() {
        view.addSubview(headerStackView)
        headerStackView.addArrangedSubview(nameLabel)
        headerStackView.addArrangedSubview(idLabel)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    func setupAutolayout() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            headerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            
            tableView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        presenter.setupCell(cell: cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.headerTitle(for: section)
    }
    
    // MARK: - UserDetailsView
    
    func refresh() {
        tableView.reloadData()
        tableView.backgroundView = nil
        hideNetworkActivityIndicator()
    }
    
    func update(nameLabel text: String) {
        nameLabel.text = text
    }
    
    func update(idLabel text: String) {
        idLabel.text = text
    }
}
