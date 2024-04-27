//
//  LeaguePresenter.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import Foundation


class LeaguePresenter {
    var leagueProtocl : LeagueProtocol! // view pr
    

    func attachView(view:LeagueProtocol)  {
        self.leagueProtocl = view   //view = ViewContrller
        print("Delegate attached")
    }
    
    func getLeaguesNetwork(){
        ApiServices.shared.getLeaguesNetwork(sport: Constants.currSport, met: Constants.leagues){ [weak self] leagueReslut in
            if let leagues = leagueReslut{
                self?.leagueProtocl.updateLeagues(res: leagues)
                
                print(leagueReslut?.result![0].league_name)
            }
            
        }
    }
}
