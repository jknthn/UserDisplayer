//
//  PostListViewController.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class PostListViewController: UITableViewController, PostListView {
    
    private let connector: PostListConnector
    private let presenter: PostListPresenter
    
    // MARK: - Initialization
    
    init(presenter: PostListPresenter, connector: PostListConnector) {
        self.presenter = presenter
        self.connector = connector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewController
    
    // MARK: - PostListView
}
