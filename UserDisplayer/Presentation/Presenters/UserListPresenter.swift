//
//  UserListPresenter.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class UserListPresenter {
    
    weak var view: UserListView?
    
    var numberOfRows: Int {
        return users.count
    }
    
    private let useCaseFactory: UseCaseFactory
    private var users = [User]()
    
    // MARK: - Initialization
    
    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
    
    // MARK: - Public
    
    func viewReady() {
        useCaseFactory.create(useCase: .showUserList(completion: { users in
            self.users = users
            self.view?.refresh()
        })).execute()
    }
    
    func setup(cell: UserCell, at row: Int) {
        cell.update(title: users[row].name)
        cell.update(subtitle: users[row].userName)
    }
}
