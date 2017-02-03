//
//  UserListPresenter.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 02/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class UserListPresenter {
    
    weak var view: UserListView!
    
    private let useCaseFactory: UseCaseFactory
    
    // MARK: - Initialization
    
    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
    
    // MARK: - Public
    
    func viewReady() {
        
    }
}
