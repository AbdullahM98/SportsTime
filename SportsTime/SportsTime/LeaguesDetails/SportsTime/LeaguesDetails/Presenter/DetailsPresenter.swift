//
//  DetailsPresenter.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import Foundation
import UserNotifications
class DetailsPresenter{
    var detailsProtocol :LeagueDetailsProtocol!
    var todayMatch = ""
    
    var favList : [League]?
    
    init(){
        favList = getAllFav()
    }
    func attachView(view:LeagueDetailsProtocol)  {
        self.detailsProtocol = view   //view = ViewContrller
        print("Deatails attached")
    }
    
    
    func getUpComingEvents(leagueId:Int){
       // let leagueIdString = String(leagueId)
        
        ApiServices.shared.getLeagueDetails(sport: Constants.currSport, met: Constants.fixtures,leagueId:leagueId,from:DateFormat.getDate().today,to:DateFormat.getDate().tomorrow,compilation:{ [weak self] result,error in
            if let res = result{
                self!.detailsProtocol.updateUpComing(fixtures: res)
                print("getUpComingEvents",result?.result?.count as Any)
                let homeTeam = res.result?[0].event_home_team ?? "Unknown Home Team"
                let awayTeam = res.result?[0].event_away_team ?? "Unknown Away Team"
                print("\(homeTeam) VS \(awayTeam)")
                self?.todayMatch = "\(homeTeam)   VS   \(awayTeam)"
            }
        })
    }
    
    func getLatestEvents(leagueId:Int){
       // let leagueIdString = String(leagueId)
        
        ApiServices.shared.getLeagueDetails(sport:Constants.currSport,met: Constants.fixtures,leagueId:leagueId,from: DateFormat.getDate().yesterday,to: DateFormat.getDate().today,compilation:{
            [weak self] result,error in
            if let res = result{
                self!.detailsProtocol.updateLatest(fixtures: res)
                print("getLatestEvents",result?.result?.count as Any)
            }
        })
    }
    
    func getTeamsLeague(leagueId:String ,met :String , sport:String){
        print("here teams league")
        ApiServices.shared.getTeams(sport: Constants.currSport, met: met, leagueId: leagueId, compelition: {
            [weak self] result , error in
            if let res = result{
                self!.detailsProtocol.updateTeams(teams: res)
                print("updadte teams",result?.result?.count)
            }
            
        })
    
    }
    
    func deleteFromFav(leagueIndex:Int){
        LocalDataSource.shared.deleteLeagueFromFav(leagueId: leagueIndex)
    }
    
    func insertLeagueToFavorite(league:League) {
        LocalDataSource.shared.insertLeagueToFavorite(league:league)
    }
    
    func getAllFav()->[League]{
       return LocalDataSource.shared.getAllLeagues()
    }
    
    func isFav(leagueId:Int) -> Bool{
        if favList!.contains(where: {$0.league_key == leagueId }) {
            return true
        }
        return false
    }
    
}

extension DetailsPresenter{
    
    
 
    
    
    
    func fireNotification(identifier:String,calendar: Calendar, title:String , body :String, notificationCenter : UNUserNotificationCenter){
       
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = todayMatch
        content.sound = .default
        
        
        
        var dateComponents = DateComponents(calendar: calendar , timeZone: TimeZone.current)
        
       
        
        var trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request){
            error in
            if let error = error {
                print("Error scheduling notf")
            }else{
                print("Added succefully")
            }
        }

        
    }
    func getCurrentMillis()->Int64{
        return  Int64(NSDate().timeIntervalSince1970 * 1000)
    }

    
    
}
