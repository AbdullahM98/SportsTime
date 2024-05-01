//
//  MockNetworkService.swift
//  SportsTimeTests
//
//  Created by raneem on 01/05/2024.
//

import Foundation
@testable import SportsTime

class MockNetworkService{
    var shouldReturnError : Bool
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    
    
    let fakeLeague :[String : Any] =
    [
        "league_key" : 1,
        "league_name": "UEFA Europa League",
        "country_key": 3,
        "country_name":"eurocups",
        "league_logo":"https:\\apiv2.allsportsapi.com/logo/logo_leagues/",
        "country_logo": ""
    ]
    
    let fakeFixture: [String: Any] = [
        "event_date": "2024-05-01",
        "event_time": "20:00",
        "event_away_team": "Away Team",
        "event_home_team": "Home Team",
        "event_final_result": "2-1",
        "league_name": "Premier League",
        "league_round": "Round 1",
        "league_logo": "https://example.com/logo.png",
        "home_team_logo": "https://example.com/home_logo.png",
        "away_team_logo": "https://example.com/away_logo.png",
        "event_home_team_logo": "https://example.com/home_team_logo.png",
        "event_away_team_logo": "https://example.com/away_team_logo.png",
        "league_season": "2023-2024",
        "event_live": "true",
        "event_stadium": "Stadium Name",
        "event_date_start": "2024-05-01",
        "event_home_final_result": "2",
        "event_away_final_result": "1",
        "event_first_player": "Player 1",
        "event_second_player": "Player 2",
        "first_player_key": 1,
        "second_player_key": 2,
        "player": "Player Name",
        "event_first_player_logo": "https://example.com/player1_logo.png",
        "event_second_player_logo": "https://example.com/player2_logo.png",
        "event_serve": "Player 1",
        "event_winner": "Player 2"
    ]
    enum ResponseWithError : Error {
        case responseError
    }
}
extension MockNetworkService{
    
    func getLeaguesNetwork(compilation: @escaping (LeagueResponse?,Error?) -> Void) {
        
        var result = LeagueResponse()
        do{
            let leagueData = try JSONSerialization.data(withJSONObject: fakeLeague)
            result = try JSONDecoder().decode(LeagueResponse.self, from: leagueData)
        }catch let error {
            print(error.localizedDescription)
        }
        //shouldReturnError -> true -> error
        //shouldReturnError -> false -> result
        if shouldReturnError {
            compilation(nil,ResponseWithError.responseError)
        }else{
            compilation(result, nil)
        }
    }
    
    
    func getFixtureNetwork(compilation: @escaping (FixturesResponse?,Error?) -> Void) {
        
        var result = FixturesResponse()
        do{
            let leagueData = try JSONSerialization.data(withJSONObject: fakeFixture)
            result = try JSONDecoder().decode(FixturesResponse.self, from: leagueData)
        }catch let error {
            print(error.localizedDescription)
        }
    
        if shouldReturnError {
            compilation(nil,ResponseWithError.responseError)
        }else{
            compilation(result, nil)
        }
    }
        
}


