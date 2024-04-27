//
//  Team.swift
//  SportsTime
//
//  Created by Abdullah Essam on 23/04/2024.
//

import UIKit


struct TeamResponse: Decodable {
    let success: Int
    let result: [Team]?
}

// MARK: - Result
struct Team: Decodable {
    let teamKey: Int?
    let teamName: String?
    let teamLogo: String?
    let players: [Player]?
    let coaches: [Coach]?

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players, coaches
    }
}
