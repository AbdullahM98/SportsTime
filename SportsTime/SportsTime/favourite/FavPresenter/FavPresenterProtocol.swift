//
//  FavPresenterProtocol.swift
//  SportsTime
//
//  Created by Abdullah Essam on 02/05/2024.
//

import Foundation
protocol FavPresenterProtocol{
    func getAllFav()->[League]
    func deleteFromFav(leagueIndex:Int)
}
