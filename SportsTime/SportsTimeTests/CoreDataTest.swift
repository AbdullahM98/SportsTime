//
//  CoreDataTest.swift
//  SportsTimeTests
//
//  Created by Abdullah Essam on 02/05/2024.
//

import XCTest
@testable import SportsTime

class CoreDataDatabaseTests: XCTestCase {
    
    var coreData: LocalDataSource!
    
    override func setUp() {
        super.setUp()
        // Initialize CoreDataDatabase instance
        coreData = LocalDataSource.shared
    }
    
    override func tearDown() {
        // Clean up after each test
        coreData = nil
        super.tearDown()
    }
    
    func testInsertLeagueItem() {
        // Create a League object for testing
        let league = League()
        league.league_key = 1
        league.league_name = "Test League"
        league.league_logo = ""
        
        
        // Test saving league item
        coreData.insertLeagueToFavorite(league: league)
        
        // Fetch leagues and check if the league is saved
        let savedLeagues = coreData.getAllLeagues()
        XCTAssertTrue(savedLeagues.contains { $0.league_key == league.league_key })
        
        // Clean up after the test
        coreData.deleteLeagueFromFav(leagueId: league.league_key!)
    }
    
    func testDeleteLeagueItem() {
       
        let league = League()
        league.league_key = 1
        league.league_name = "Test League"
        league.league_logo = ""
       
        coreData.insertLeagueToFavorite(league: league)
        
        
        coreData.deleteLeagueFromFav(leagueId: league.league_key!)
        
        
        let savedLeagues = coreData.getAllLeagues()
        XCTAssertFalse(savedLeagues.contains { $0.league_key == league.league_key })
    }
}
