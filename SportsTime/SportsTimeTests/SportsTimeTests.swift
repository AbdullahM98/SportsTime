//
//  SportsTimeTests.swift
//  SportsTimeTests
//
//  Created by Abdullah Essam on 22/04/2024.
//

import XCTest
@testable import SportsTime

final class SportsTimeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        
        let myExpection = expectation(description: "wating for api alooo ")
        
        ApiServices.shared.getLeaguesNetwork(sport: "football", met: "Fixtures", compilation:{ result,error in
            if let error = error {
                XCTFail()
            }else{
                //XCTAssertEqual(result?.result?.count, 865)
                XCTAssertNotNil(result?.result)
                myExpection.fulfill() // done
            }
        })
        waitForExpectations(timeout: 5)
    }
    func testGetLeagueDetails(){
        
        let myExpection = expectation(description: "wating for api alooo ")
        
        ApiServices.shared.getLeagueDetails(sport: "basketball", met: "Fixtures", leagueId: 766, from:"2024-04-28", to: "2024-05-30", compilation:{ result,error in
            if let error = error {
                XCTFail()
            }else{
               // XCTAssertEqual(result?.data?.count, 24)
                XCTAssertNotNil(result?.result)
                myExpection.fulfill() // done
            }
        })
        waitForExpectations(timeout: 5)
    }

}
