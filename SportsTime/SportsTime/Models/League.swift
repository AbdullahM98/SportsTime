//
//  League.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit

struct League : Codable {

    var leagueKey :Int
    var leagueName :String
    var countryKey :Int
    var countryName :String
    var leagueImg :String
    var countryImg :String
    

    enum LeagueEnumKeys : String , CodingKey{
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueImg = "league_logo"
        case countryImg = "country_logo"
    }
}
