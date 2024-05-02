//
//  FavPresenter.swift
//  SportsTime
//
//  Created by Abdullah Essam on 29/04/2024.
//

import UIKit
import Kingfisher
class FavoritePresenter {
    
    var favLeagues :[League] = []
    var view : FavouriteProtocol?
    
    
    func checkNetworkReachability() -> Bool{
        if ReachabilityNetwork.shared.isNetworkAvailable{
            return true
        }else{
         return false
        }
    }
    
}





extension FavoritePresenter  : FavPresenterProtocol{
    
   

    func attachView(view: FavouriteProtocol) {
        self.view = view
    }
    
    func getAllFav()->[League]{
        let leagues = LocalDataSource.shared.getAllLeagues()
        favLeagues = leagues
//        updateList()
//        view?.reloadTableView()
        return leagues
       
    }
    
    func deleteFromFav(leagueIndex:Int){
        LocalDataSource.shared.deleteLeagueFromFav(leagueId: leagueIndex)
    }
}






