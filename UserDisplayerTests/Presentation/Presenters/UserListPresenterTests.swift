//
//  UserListPresenterTests.swift
//  UserDisplayer
//
//  Created by Jeremi Kaczmarczyk on 03/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import XCTest
@testable import UserDisplayer

class UserListPresenterTests: XCTestCase {
    
    var presenter: UserListPresenter!
    var view: UserListViewMock!
    var useCaseFactory: UseCaseFactoryMock!
    var data = [UserDisplayData]()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        view = UserListViewMock()
        useCaseFactory = UseCaseFactoryMock(entityGateway: EntityGatewayMock())
        presenter = UserListPresenter(useCaseFactory: useCaseFactory)
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
        useCaseFactory.data = [UserDisplayData.mock1, UserDisplayData.mock2]
        presenter.viewReady()
        XCTAssertEqual(useCaseFactory.data.count, presenter.numberOfRows)
    }
    
    func testCellIsConfigured() {
        let cell = UserCellMock()
        useCaseFactory.data = [UserDisplayData.mock1]
        presenter.viewReady()
        presenter.setup(cell: cell, at: 0)
        XCTAssertEqual(UserDisplayData.mock1.name, cell.title)
        XCTAssertEqual(UserDisplayData.mock1.userName, cell.subtitle)
    }
    
    
    // MARK: - Mocks
    
    class UserCellMock: UserCell {
        
        var title = ""
        var subtitle = ""
        
        func update(title: String) {
            self.title = title
        }
        
        func update(subtitle: String) {
            self.subtitle = subtitle
        }
    }
    
    class EntityGatewayMock: EntityGateway {
        
        func getUsers(completion: @escaping ([User]) -> Void) { }
    }
    
    class UseCaseFactoryMock: UseCaseFactory {
        
        var useCase: ShowUserListUseCaseMock!
        var data = [UserDisplayData]()
        
        override func create(useCase: UseCaseFactory.Use) -> UseCase {
            switch useCase {
            case .showUserList(let completion):
                self.useCase = ShowUserListUseCaseMock(completion: completion)
                self.useCase.data = data
                return self.useCase
            }
        }
        
    }
    
    class ShowUserListUseCaseMock: UseCase {
        
        let completion: ShowUserListCompletion
        var executeWasInvoked = false
        var data = [UserDisplayData]()
        
        init(completion: @escaping ShowUserListCompletion) {
            self.completion = completion
        }
        
        func execute() {
            executeWasInvoked = true
            completion(data)
        }
    }
    
    class UserListViewMock: UserListView {
        
        var refreshWasInvoked = false
        
        func refresh() {
            refreshWasInvoked = true
        }
    }
    
}
