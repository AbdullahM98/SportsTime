//
//  TeamsPresenter.swift
//  SportsTime
//
//  Created by Abdullah Essam on 25/04/2024.
//

import UIKit

class TeamsPresenter: NSObject {

    var view : TeamsProtocol?
    
    func attachView(view:TeamsProtocol){
        self.view = view
         
    }
    
    func getTeam(teamKey:String){
        ApiServices.shared.getTeamDetails(sport: "football", teamId: teamKey, compelition: {[weak self] teamResponse in
            guard let team = teamResponse else{return}
            self?.view!.updateView(team: team)
        })
    }
}
