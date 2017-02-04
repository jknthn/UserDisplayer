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
    
    private let useCaseFactory: UseCaseFactory
    
    // MARK: - Initialization
    
    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
    
    // MARK: - Public
    
    func viewReady() {
        
    }
    
}
