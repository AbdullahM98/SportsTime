//
//  LeaguePresenter.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import Foundation


class LeaguePresenter {
    var leagueProtocl : LeagueProtocol!
    

    func attachView(view:LeagueProtocol)  {
        self.leagueProtocl = view   //view = ViewContrller
        print("Delegate attached")
    }
    
    func getLeaguesNetwork(){
        ApiServices.shared.getLeaguesNetwork{[weak self] leagueReslut in
            self?.leagueProtocl.updateLeagues(res: leagueReslut!)
            
            print(leagueReslut?.result![0].league_name)
        }
    }
}
