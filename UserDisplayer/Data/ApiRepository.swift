//
//  ApiRepository.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

class ApiRepository: EntityGateway {
    
    

    
    // MARK: - EntityGateway
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        
    }
    
    func getPosts(forUserId id: Int, completion: @escaping ([Post]) -> Void) {
        
    }
    
    // MARK: - Utility
}
