//
//  ApiServices.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit
import Alamofire

class ApiServices  {
    
    static let shared : ApiServices = ApiServices()
    private  init() {
        
    }
    
    func getLeaguesNetwork(compilation: @escaping (LeagueResponse?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c")
        
        AF.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data { //data that came from the server
                        //decode the json into LeagueResponse obj
                        let result: LeagueResponse = try JSONDecoder().decode(LeagueResponse.self, from: data)
                        
                        print(result.result!.count)
                        //when i call the method this allow to receive and handle the response
                        compilation(result)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compilation(nil)
                print(error.localizedDescription)
                
            }
        }
    }
    
    func getLeagueDetails(url:String,leagueId:Int, compilation: @escaping (FixturesResponse?) -> Void) {
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data {
                        let result: FixturesResponse = try JSONDecoder().decode(FixturesResponse.self, from: data)
                       // print("today matches ",result.result!.count)
                        compilation(result)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compilation(nil)
                print(error.localizedDescription)
                
            }
        }
    }
    
    
    
    
    func getTeams(sport:String,met:String,leagueId:String,compelition: @escaping (TeamResponse?)->Void){
        let url = URL(string: "\(Constants.Base_Url)\(sport)/?&met=\(met)&leagueId=\(leagueId)&APIkey=\(Constants.Api_key)")
        AF.request(url! , method: .get).responseJSON{response in
            switch response.result{
            case .success:
                do{
                    if let fetchedData =  response.data {
                        let result : TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: fetchedData)
                        print(result.result?.count)
                        compelition(result)
                    }
                } catch{
                    print(error)
                }
            case .failure(let error ):
                compelition(nil)
                print(error)
            }
            
        }
    }

    func getTeamDetails(sport:String,teamId:String,compelition:@escaping (TeamResponse?)->Void){
        let url = URL(string:"\(Constants.Base_Url)\(sport)/?&met=Teams&teamId=\(teamId)&APIkey=\(Constants.Api_key)")
        AF.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data { //data that came from the server
                        //decode the json into LeagueResponse obj
                        let result: TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: data)
                        
                        print(result.result?.count)
                        //when i call the method this allow to receive and handle the response
                        compelition(result)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compelition(nil)
                print(error.localizedDescription)
                
            }
        }
  
    }
    
    

    }

