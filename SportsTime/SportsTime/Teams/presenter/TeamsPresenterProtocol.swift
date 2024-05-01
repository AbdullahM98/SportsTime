//
//  TeamsPresenterProtocol.swift
//  SportsTime
//
//  Created by Abdullah Essam on 02/05/2024.
//

import Foundation

protocol TeamsPresenterProtocol{
    func attachView(view:TeamsProtocol)
    func getTeam(teamKey:String)
}
