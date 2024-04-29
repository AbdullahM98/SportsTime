//
//  Constants.swift
//  SportsTime
//
//  Created by raneem on 26/04/2024.
//

import Foundation

class Constants {
    
    static let Base_Url = "https://apiv2.allsportsapi.com/"
    static let Api_key = "2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c"
    static let fixtures =  "Fixtures"
    static let leagues =  "Leagues"
    static let teams =  "Teams"
    static var currSport = ""
    
}
enum Sports:String {
    case football = "football"
    case tennis = "tennis"
    case basketball = "basketball"
    case cricket = "cricket"

}




