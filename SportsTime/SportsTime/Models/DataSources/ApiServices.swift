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
    
    func getLeaguesNetwork(sport :String,met:String,compilation: @escaping (LeagueResponse?,Error?) -> Void) {
        let url = URL(string: "\(Constants.Base_Url)\(sport)/?met=\(met)&APIkey=\(Constants.Api_key)")
        
        AF.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data { //data that came from the server
                        //decode the json into LeagueResponse obj
                        let result: LeagueResponse = try JSONDecoder().decode(LeagueResponse.self, from: data)
                        
                        print(result.result!.count)
                        //when i call the method this allow to receive and handle the response
                        compilation(result,nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compilation(nil,error)
                print(error.localizedDescription)
                
            }
        }
    }
    
    func getLeagueDetails(sport:String,met:String,leagueId:Int,from:String , to:String, compilation: @escaping (FixturesResponse?,Error?) -> Void) {
        let url = "\(Constants.Base_Url)\(sport)/?met=\(met)&APIkey=\(Constants.Api_key)&from=\(from)&to=\(to)&leagueId=\(leagueId)"
        
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data {
                        let result: FixturesResponse = try JSONDecoder().decode(FixturesResponse.self, from: data)
                       // print("today matches ",result.result!.count)
                        compilation(result,nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compilation(nil,error)
                print(error.localizedDescription)
                
            }
        }
    }
    
    
    
    
    func getTeams(sport:String,met:String,leagueId:String,compelition: @escaping (TeamResponse?,Error?)->Void){
        let url = URL(string: "\(Constants.Base_Url)\(sport)/?&met=\(met)&leagueId=\(leagueId)&APIkey=\(Constants.Api_key)")
        AF.request(url! , method: .get).responseJSON{ response  in
            switch response.result{
            case .success:
                do{
                    if let fetchedData =  response.data {
                        let result : TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: fetchedData)
                        print(result.result?.count)
                        compelition(result , nil)
                    }
                } catch{
                    print(error)
                }
            case .failure(let error ):
                compelition(nil , error)
                print(error)
            }
            
        }
    }

    func getTeamDetails(sport:String,teamId:String,compelition:@escaping (TeamResponse? , Error?)->Void){
        let url = URL(string:"\(Constants.Base_Url)\(sport)/?&met=Teams&teamId=\(teamId)&APIkey=\(Constants.Api_key)")
        AF.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    if let data = response.data { 
                        
                        let result: TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: data)
                        
                        print(result.result?.count)
                       
                        compelition(result,nil)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                compelition(nil,error)
                print(error.localizedDescription)
                
            }
        }
  
    }
    
}

