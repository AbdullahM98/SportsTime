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
    
    
    func getUpComingEvents(leagueId:Int){
        let leagueIdString = String(leagueId)
        let url = "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c&from=\(DateFormat.getDate().today)&to=\(DateFormat.getDate().tomorrow)&leagueId=\(leagueId)"

        print(url)
        
        
        ApiServices.shared.getLeagueDetails(url:url,leagueId:leagueId,compilation:{ [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateUpComing(fixtures: res)
                print("getUpComingEvents",result?.result?.count as Any)
            }
        })
    }
    
    func getLatestEvents(leagueId:Int){
        let leagueIdString = String(leagueId)
        let url =  "https://apiv2.allsportsapi.com/football/?met=Fixtures&from=\(DateFormat.getDate().yesterday)&to=\(DateFormat.getDate().yesterday)&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c"
        
        ApiServices.shared.getLeagueDetails(url:url,leagueId:leagueId,compilation:{
            [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateLatest(fixtures: res)
                print("getLatestEvents",result?.result?.count as Any)
            }
        })
    }
    
    func getTeamsLeague(leagueId:String ,met :String , sport:String){
        print("here teams league")
        ApiServices.shared.getTeams(sport: sport, met: met, leagueId: leagueId, compelition: {
            [weak self] result in
            if let res = result{
                self!.detailsProtocol.updateTeams(teams: res)
                print("updadte teams",result?.result?.count)
            }
            
        })
    
    }
}
