//
//  Team.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit

class TeamResponse: Codable {
    var success: Int?
    var result: [Team]
}

struct Team: Codable {
    var team_key: Int?
    var team_name: String?
    var team_logo: String?
    var players: [Player]?
}
