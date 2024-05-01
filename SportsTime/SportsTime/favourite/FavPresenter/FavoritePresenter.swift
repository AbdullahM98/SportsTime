//
//  FavPresenter.swift
//  SportsTime
//
//  Created by Abdullah Essam on 29/04/2024.
//

import UIKit

class FavoritePresenter  : FavPresenterProtocol{

    var view : FavouriteProtocol?
    
    func getAllFav()->[League]{
       return LocalDataSource.shared.getAllLeagues()
    }
    
    func deleteFromFav(leagueIndex:Int){
        LocalDataSource.shared.deleteLeagueFromFav(leagueId: leagueIndex)
    }
}
