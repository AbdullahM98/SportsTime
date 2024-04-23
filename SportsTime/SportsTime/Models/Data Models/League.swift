//
//  League.swift
//  SportsTime
//
//  Created by Abdullah Essam on 23/04/2024.
//
//


import UIKit

class LeagueResponse : Decodable {
    var success : Int?
    var result : Array<League>?
    
}

class League : Decodable {
    
    var league_key :Int?
    var league_name :String?
    var country_key :Int?
    var country_name :String?
    var league_logo :String?
    var country_logo :String?
    
    
    
//    enum leagueKeys : String , CodingKey {
//        case leagueKey = "league_key"
//        case leagueName = "league_name"
//        case countryKey = "country_key"
//        case countryName = "country_name"
//        case leagueLogo = "league_logo"
//        case countryLogo = "country_logo"
//    }
}
