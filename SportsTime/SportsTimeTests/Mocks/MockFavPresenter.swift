//
//  MockFavPresenter.swift
//  SportsTimeTests
//
//  Created by Abdullah Essam on 02/05/2024.
//

import Foundation
@testable import SportsTime
class MockFavPresenter : FavPresenterProtocol{
    var leagues: [League] = []
    var updateFavViewCalled = false
    func getAllFav() -> [SportsTime.League] {
        return [League]()
    }
    
    func deleteFromFav(leagueIndex: Int) {
        leagues.remove(at: leagueIndex)
              updateFavViewCalled = true
    }
    
    
}
