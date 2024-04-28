//
//  DetailsPresenter.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import Foundation
class DetailsPresenter{
    var detailsProtocol :LeagueDetailsProtocol!
  
    
    func attachView(view:LeagueDetailsProtocol)  {
        self.detailsProtocol = view   //view = ViewContrller
        print("Deatails attached")
    }
    
    
    func getUpComingEvents(leagueId:Int, sport:String){
        let leagueIdString = String(leagueId)
        
        ApiServices.shared.getLeagueDetails(sport: sport, met: Constants.fixtures,leagueId:leagueId,from:DateFormat.getDate().today,to:DateFormat.getDate().tomorrow,compilation:{ [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateUpComing(fixtures: res)
                print("getUpComingEvents",result?.result?.count as Any)
            }
        })
    }
    
    func getLatestEvents(leagueId:Int){
        let leagueIdString = String(leagueId)
        
        ApiServices.shared.getLeagueDetails(sport:Constants.currSport,met: Constants.fixtures,leagueId:leagueId,from: DateFormat.getDate().yesterday,to: DateFormat.getDate().yesterday,compilation:{
            [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateLatest(fixtures: res)
                print("getLatestEvents",result?.result?.count as Any)
            }
        })
    }
    
    func getTeamsLeague(leagueId:String ,met :String , sport:String){
        print("here teams league")
        ApiServices.shared.getTeams(sport: Constants.currSport, met: met, leagueId: leagueId, compelition: {
            [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateTeams(teams: res)
                print("updadte teams",result?.result?.count)
            }
            
        })
    
    }
    
    func insertLeague(league:League,leagueType:String) {
        DataBaseManger.insertLeagueToFavorite(league:league,leagueType:leagueType)
    }
}