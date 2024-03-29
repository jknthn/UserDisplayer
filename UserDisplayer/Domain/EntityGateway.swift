//
//  EntityGateway.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

protocol EntityGateway {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func getPosts(forUserId id: Int, completion: @escaping (Result<[Post], Error>) -> Void)
}
