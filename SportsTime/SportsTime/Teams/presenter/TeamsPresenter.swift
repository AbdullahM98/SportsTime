//
//  TeamsPresenter.swift
//  SportsTime
//
//  Created by Abdullah Essam on 25/04/2024.
//

import UIKit

class TeamsPresenter: TeamsPresenterProtocol {

    var view : TeamsProtocol?
    
    func attachView(view:TeamsProtocol){
        self.view = view
         
    }
    
    func getTeam(teamKey:String){
        ApiServices.shared.getTeamDetails(sport: "football", teamId: teamKey, compelition: {[weak self] teamResponse , error in
            guard let team = teamResponse else{return}
            self?.view!.updateView(team: team)
        })
    }
}
