//
//  PostListPresenter.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 04/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class UserDetailsPresenter {
    
    weak var view: UserDetailsView?
    
    var title: String {
        return "\(user.userName) Profile"
    }
    
    private let useCaseFactory: UseCaseFactory
    private let user: UserDisplayData
    
    // MARK: - Initialization
    
    init(user: UserDisplayData, useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
        self.user = user
    }
    
    // MARK: - Public
    
    func viewReady() {
        
    }
    
}
