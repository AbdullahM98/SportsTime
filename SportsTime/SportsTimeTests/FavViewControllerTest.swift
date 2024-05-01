//
//  FavViewControllerTest.swift
//  SportsTimeTests
//
//  Created by Abdullah Essam on 02/05/2024.
//

import XCTest
@testable import SportsTime
final class FavViewControllerTest: XCTestCase {

    var viewController: FavoriteViewController!
       var mockPresenter: MockFavPresenter!
       var mockLocalDataSource: CoreDataDatabaseTests!

       override func setUp() {
           super.setUp()
           mockLocalDataSource = MockLocalDataSource()
           mockPresenter = MockFavoritePresenter()
           viewController = FavoriteViewController()
           viewController.presenter = mockPresenter
           viewController.localDataSource = mockLocalDataSource
       }

       override func tearDown() {
           viewController = nil
           mockPresenter = nil
           mockLocalDataSource = nil
           super.tearDown()
       }

       func testUpdateViewOnLoad() {
           // Arrange
           let league = League(league_name: "Test League", league_key: 1, league_logo: "https://example.com/logo.png")
           mockLocalDataSource.leagues.append(league)

           // Act
           viewController.viewDidLoad()

           // Assert
           XCTAssertEqual(viewController.favLeagues.count, 1)
           XCTAssertEqual(viewController.favLeagues.first?.league_name, "Test League")
       }

       func testDeleteFromFav() {
           // Arrange
           let league = League(league_name: "Test League", league_key: 1, league_logo: "https://example.com/logo.png")
           mockLocalDataSource.leagues.append(league)
           viewController.favLeagues.append(league)

           // Act
           viewController.deleteFromFav(indexPath: IndexPath(section: 0,row: 0))

           // Assert
           XCTAssertEqual(mockPresenter.updateFavViewCalled, true)
           XCTAssertEqual(viewController.favLeagues.count, 0)
       }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
