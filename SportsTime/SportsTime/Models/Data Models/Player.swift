//
//  Player.swift
//  SportsTime
//
//  Created by Abdullah Essam on 23/04/2024.
//



import UIKit

class PlayerResponse: Codable {
    let success: Int
    let result: [Player]?
}
// MARK: - Coach


// MARK: - Result
class Player: Codable {
    let playerKey: Int?
    let playerName, playerNumber: String?
    let playerType, playerAge, playerMatchPlayed, playerGoals: String?
    let playerYellowCards, playerRedCards, playerInjured: String?
    let playerSubstituteOut, playerSubstitutesOnBench, playerAssists, playerIsCaptain: String?
    let playerShotsTotal, playerGoalsConceded, playerFoulsCommited, playerTackles: String?
    let playerBlocks, playerCrossesTotal, playerInterceptions, playerClearances: String?
    let playerDispossesed, playerSaves, playerInsideBoxSaves, playerDuelsTotal: String?
    let playerDuelsWon, playerDribbleAttempts, playerDribbleSucc, playerPenComm: String?
    let playerPenWon, playerPenScored, playerPenMissed, playerPasses: String?
    let playerPassesAccuracy, playerKeyPasses, playerWoordworks, playerRating: String?
    let teamName: String?
    let teamKey: Int?
    let playerImage: String?

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerType = "player_type"
        case playerAge = "player_age"
        case playerMatchPlayed = "player_match_played"
        case playerGoals = "player_goals"
        case playerYellowCards = "player_yellow_cards"
        case playerRedCards = "player_red_cards"
        
        case playerInjured = "player_injured"
        case playerSubstituteOut = "player_substitute_out"
        case playerSubstitutesOnBench = "player_substitutes_on_bench"
        case playerAssists = "player_assists"
        case playerIsCaptain = "player_is_captain"
        case playerShotsTotal = "player_shots_total"
        case playerGoalsConceded = "player_goals_conceded"
        case playerFoulsCommited = "player_fouls_commited"
        case playerTackles = "player_tackles"
        case playerBlocks = "player_blocks"
        case playerCrossesTotal = "player_crosses_total"
        case playerInterceptions = "player_interceptions"
        case playerClearances = "player_clearances"
        case playerDispossesed = "player_dispossesed"
        case playerSaves = "player_saves"
        case playerInsideBoxSaves = "player_inside_box_saves"
        case playerDuelsTotal = "player_duels_total"
        case playerDuelsWon = "player_duels_won"
        case playerDribbleAttempts = "player_dribble_attempts"
        case playerDribbleSucc = "player_dribble_succ"
        case playerPenComm = "player_pen_comm"
        case playerPenWon = "player_pen_won"
        case playerPenScored = "player_pen_scored"
        case playerPenMissed = "player_pen_missed"
        case playerPasses = "player_passes"
        case playerPassesAccuracy = "player_passes_accuracy"
        case playerKeyPasses = "player_key_passes"
        case playerWoordworks = "player_woordworks"
        case playerRating = "player_rating"
        case teamName = "team_name"
        case teamKey = "team_key"
        case playerImage = "player_image"
    }
}
struct Coach: Decodable {
    let coachName: String?
    let coachCountry, coachAge: String?

    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
        case coachCountry = "coach_country"
        case coachAge = "coach_age"
    }
}
