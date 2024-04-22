//
//  League.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit

class LeagueResponse : Decodable {
    var success : Int?
    var result : Array<League>?
    
}

class League : Decodable {
    
    var leagueKey :Int?
    var leagueName :String?
    var countryKey :Int?
    var countryName :String?
    var leagueImg :String?
    var countryImg :String?
    
    
    
    enum leagueKeys : String , CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}
