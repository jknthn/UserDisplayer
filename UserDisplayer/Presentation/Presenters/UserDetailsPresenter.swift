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
    
    var numberOfSections: Int {
        return 1
    }
    
    enum UserDetailsSections: Int {
        case posts
        
        var title: String {
            switch self {
            case .posts:
                return "Posts"
            }
        }
    }
    
    private let useCaseFactory: UseCaseFactory
    private let user: UserDisplayData
    
    private var posts = [PostDisplayData]()
    
    // MARK: - Initialization
    
    init(user: UserDisplayData, useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
        self.user = user
    }
    
    // MARK: - Public
    
    func viewReady() {
        useCaseFactory.create(useCase: .showPostList(user: user, completion: { posts in
            self.posts = posts
            self.view?.refresh()
        })).execute()
        view?.update(nameLabel: "Real name: \(user.name)")
        view?.update(idLabel: "User ID: \(user.id)")
    }
    
    func setupCell(cell: PostCell, at row: Int) {
        cell.update(id: "No: \(posts[row].id)")
        cell.update(title: posts[row].title)
        cell.update(user: user.userName)
        cell.update(body: posts[row].body)
    }
    
    func numberOfRows(for section: Int) -> Int {
        switch section {
        case UserDetailsSections.posts.rawValue:
            return posts.count
        default:
            assertionFailure("This section should not exist")
            return 0
        }
    }
    
    func headerTitle(for section: Int) -> String {
        switch section {
        case UserDetailsSections.posts.rawValue:
            return UserDetailsSections.posts.title + " (\(posts.count))"
        default:
            assertionFailure("This section should not exist")
            return ""
        }
    }
}
