//
//  MockNetworkMangerTests.swift
//  SportsTimeTests
//
//  Created by raneem on 30/04/2024.
//

import XCTest

final class MockNetworkMangerTests: XCTestCase {
    var mockObject : MockNetworkService!
    
    override func setUpWithError() throws {
      mockObject = MockNetworkService(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetLeaguesNetwork(){
        mockObject.getLeaguesNetwork{ result,error in
            if let error = error {
                XCTFail()
            }else{
                XCTAssertNotNil(result)
            }
            
        }
    }
    
    func testGetFixtureNetwork(){
        mockObject.getFixtureNetwork{ result,error in
            if let error = error {
                XCTFail()
            }else{
                XCTAssertNotNil(result)
            }
            
        }
    }
    
}
