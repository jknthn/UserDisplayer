//
//  ApiRepository.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case unknown
    case network
    case parse
}

class ApiRepository: EntityGateway {
    
    // MARK: - EntityGateway
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        
    }
    
    func getPosts(forUserId id: Int, completion: @escaping (Result<[Post], Error>) -> Void) {
        
    }
    
    // MARK: - Utility
    
    private func get<T: JSONParsable>(_ endpoint: ApiEndpoint, completion: @escaping (Result<[T], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if let _ = error {
                completion(.error(ApiError.network))
            }
            DispatchQueue.main.async {
                do {
                    guard
                        let data = data,
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [JSONDictionary]
                    else {
                        completion(.error(ApiError.parse))
                        return
                    }
                    completion(.success(json.flatMap(T.fromJSON)))
                } catch {
                    completion(.error(ApiError.parse))
                }
            }
        }
    }
}
