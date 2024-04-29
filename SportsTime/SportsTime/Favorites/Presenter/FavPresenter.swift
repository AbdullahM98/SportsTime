//
//  FavPresenter.swift
//  SportsTime
//
//  Created by Abdullah Essam on 28/04/2024.
//

import UIKit

class FavPresenter {

    var view : FavoriteProtocol?
    
    func getAllFav()->[League]{
       return LocalDataSource.shared.getAllLeagues()
    }
    
    func deleteFromFav(leagueIndex:Int){
        LocalDataSource.shared.deleteMovie(leagueIndex: leagueIndex)
    }
}
