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
    
    let fakeTeam : [String:Any] =

   [
        
            "team_key": 96,
            "team_name": "Juventus",
            "team_logo": "https://apiv2.allsportsapi.com/logo/96_juventus.jpg",
            "players": [
                
                    "player_key": 41841276,
                    "player_image": "https://apiv2.allsportsapi.com/logo/players/472_m-perin.jpg",
                    "player_name": "M. Perin",
                    "player_number": "36",
                    "player_country": nil,
                    "player_type": "Goalkeepers",
                    "player_age": "31",
                    "player_match_played": "2",
                    "player_goals": "0",
                    "player_yellow_cards": "0",
                    "player_red_cards": "0",
                    "player_injured": "No",
                    "player_substitute_out": "0",
                    "player_substitutes_on_bench": "26",
                    "player_assists": "0",
                    "player_birthdate": "1992-11-10",
                    "player_is_captain": "0",
                    "player_shots_total": "",
                    "player_goals_conceded": "3",
                    "player_fouls_committed": "",
                    "player_tackles": "",
                    "player_blocks": "",
                    "player_crosses_total": "",
                    "player_interceptions": "",
                    "player_clearances": "",
                    "player_dispossesed": "",
                    "player_saves": "7",
                    "player_inside_box_saves": "2",
                    "player_duels_total": "2",
                    "player_duels_won": "2",
                    "player_dribble_attempts": "",
                    "player_dribble_succ": "",
                    "player_pen_comm": "",
                    "player_pen_won": "",
                    "player_pen_scored": "0",
                    "player_pen_missed": "0",
                    "player_passes": "74",
                    "player_passes_accuracy": "50",
                    "player_key_passes": "",
                    "player_woordworks": "",
                    "player_rating": "6.65"
            ]]

   
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
    
    func getTeamDetails(compilation:@escaping(TeamResponse?,Error?)->Void){
        var result: TeamResponse = TeamResponse(success: 1, result: [])
        do{
            let teamData = try JSONSerialization.data(withJSONObject: fakeTeam)
            result = try JSONDecoder().decode(TeamResponse.self, from: teamData)
        }catch let error {
            print(error)
        }
        
        if shouldReturnError {
            compilation(nil,ResponseWithError.responseError)
        }else{
            compilation(result,nil)
        }
    }
    
    func getTeamsFromNetwork(compilation:@escaping(TeamResponse?,Error?)->Void){
        var result: TeamResponse = TeamResponse(success: 1, result: [])
        do{
            let teamData = try JSONSerialization.data(withJSONObject: fakeTeam)
            result = try JSONDecoder().decode(TeamResponse.self, from: teamData)
        }catch let error {
            print(error)
        }
        
        if shouldReturnError {
            compilation(nil,ResponseWithError.responseError)
        }else{
            compilation(result,nil)
        }
    }
}


