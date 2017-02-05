//
//  UserDetailsPresenterTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 05/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class UserDetailsPresenterTests: XCTestCase {
    
    var presenter: UserDetailsPresenter!
    var view: UserDetailsViewMock!
    var useCaseFactory: UseCaseFactoryMock!
    var data = [PostDisplayData]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        view = UserDetailsViewMock()
        useCaseFactory = UseCaseFactoryMock(entityGateway: EntityGatewayMock())
        presenter = UserDetailsPresenter(user: UserDisplayData.mock1, useCaseFactory: useCaseFactory)
        presenter.view = view
    }
    
    override func tearDown() {
        presenter = nil
        view = nil
        useCaseFactory = nil
        data = []
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testViewReadyInvokesUseCase() {
        presenter.viewReady()
        XCTAssertTrue(useCaseFactory.useCase.executeWasInvoked)
    }
    
    func testViewReadyRefreshesView() {
        presenter.viewReady()
        XCTAssertTrue(view.refreshWasInvoked)
    }
    
    func testCountProperNumberOfData() {
        useCaseFactory.data = [PostDisplayData.user1MockPost1, PostDisplayData.user1MockPost2]
        presenter.viewReady()
        XCTAssertEqual(1, presenter.numberOfSections)
        XCTAssertEqual(useCaseFactory.data.count, presenter.numberOfRows(for: 0))
    }
    
    func testCellIsConfigured() {
        let cell = PostCellMock()
        useCaseFactory.data = [PostDisplayData.user1MockPost1]
        presenter.viewReady()
        presenter.setupCell(cell: cell, at: 0)
        XCTAssertEqual(cell.title, PostDisplayData.user1MockPost1.title)
        XCTAssertEqual(cell.id, "No: \(PostDisplayData.user1MockPost1.id)")
        XCTAssertEqual(cell.user, PostDisplayData.user1MockPost1.userName)
        XCTAssertEqual(cell.body, PostDisplayData.user1MockPost1.body)
    }
    
    func testTitleString() {
        XCTAssertEqual(presenter.title, "\(UserDisplayData.mock1.userName) Profile")
    }
    
    // MARK: - Mocks
    
    class PostCellMock: PostCell {
        
        var title = ""
        var id = ""
        var user = ""
        var body = ""
        
        func update(id: String) {
            self.id = id
        }

        func update(user: String) {
            self.user = user
        }
        
        func update(title: String) {
            self.title = title
        }
        
        func update(body: String) {
            self.body = body
        }
    }
    
    class EntityGatewayMock: EntityGateway {
        
        func getUsers(completion: @escaping ([User]) -> Void) { }
        func getPosts(forUserId id: Int, completion: @escaping ([Post]) -> Void) { }
    }
    
    class UseCaseFactoryMock: UseCaseFactory {
        
        var useCase: ShowPostListUseCaseMock!
        var data = [PostDisplayData]()
        
        override func create(useCase: UseCaseFactory.Use) -> UseCase {
            switch useCase {
            case .showPostList(_, let completion):
                self.useCase = ShowPostListUseCaseMock(completion: completion)
                self.useCase.data = data
                return self.useCase
            default:
                return super.create(useCase: useCase)
            }
        }
        
    }
    
    class ShowPostListUseCaseMock: UseCase {
        
        let completion: ShowPostListCompletion
        var executeWasInvoked = false
        var data = [PostDisplayData]()
        
        init(completion: @escaping ShowPostListCompletion) {
            self.completion = completion
        }
        
        func execute() {
            executeWasInvoked = true
            completion(data)
        }
    }
    
    class UserDetailsViewMock: UserDetailsView {
        
        var refreshWasInvoked = false
        
        func refresh() {
            refreshWasInvoked = true
        }
        
        func update(idLabel text: String) { }
        func update(nameLabel text: String) { }
    }
    
}
