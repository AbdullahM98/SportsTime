////
////  TeamsViewControllerTest.swift
////  SportsTimeTests
////
////  Created by Abdullah Essam on 02/05/2024.
////
//
//import XCTest
//@testable import SportsTime
//
//
//
//class TeamsTableViewControllerTests: XCTestCase {
//    var viewController: TeamsTableViewController!
//    var mockPresenter: MockTeamsPresenter!
//    
//
//    override func setUp() {
//        super.setUp()
//        mockPresenter = MockTeamsPresenter()
//        viewController = TeamsTableViewController()
//        viewController.title = "a"
//        viewController.presenter = mockPresenter
//    }
//
//    override func tearDown() {
//        viewController = nil
//        mockPresenter = nil
//        super.tearDown()
//    }
//
//    func testUpdateView() {
//        // Arrange
//        let teamKey = "123"
//        mockPresenter.teamResponse = TeamResponse(success: 200, result: [Team]())
//        
//        // Act
//        viewController.viewDidLoad()
//        mockPresenter.getTeam(teamKey: teamKey)
//        
//        // Assert
//        XCTAssertTrue(mockPresenter.updateViewCalled, "updateView should be called")
//        XCTAssertNotNil(viewController.title)
//        // Add more assertions to check if the image and players are set correctly
//    }
//}
