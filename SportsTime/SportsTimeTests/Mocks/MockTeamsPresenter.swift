//
//  MockTeamsPresenter.swift
//  SportsTimeTests
//
//  Created by Abdullah Essam on 02/05/2024.
//

@testable import SportsTime

class MockTeamsPresenter: TeamsPresenterProtocol {
    var view: TeamsProtocol?
    var teamKey: String?
    var teamResponse: TeamResponse?
    var updateViewCalled = false
    
    
    func attachView( view: TeamsProtocol) {
        self.view = view
    }
    
    func getTeam( teamKey: String) {
        self.teamKey = teamKey
        updateViewCalled = true
        teamResponse = TeamResponse(success: 200, result: [Team]())
        
        view?.updateView(team: teamResponse!)
    }
}
