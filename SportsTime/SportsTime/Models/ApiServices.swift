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
    
    
//    func fetchLeagues(completion: @escaping(Result<LeagueResponse,Error>) -> Void) {
//
//        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c")
//        AF.request(url!,parameters:nil).validate().response{
//            respon in
//            switch respon.result{
//            case .success(let data):
//                do{
//                    let jsonData = try JSONDecoder().decode(LeagueResponse.self, from: data!)
//                    completion(.success(jsonData))
//                    print(jsonData.result)
//
//                } catch {
//                    print(error.localizedDescription)
//                    completion(.failure(error))
//
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                completion(.failure(error))
//
//            }
//
//        }
//    }
//
    func fetchLeagues(completion: @escaping(Result<LeagueResponse,Error>) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c")
        AF.request(url!, parameters: nil).validate().response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(LeagueResponse.self, from: data!)
                    completion(.success(jsonData))
                    // Correctly print each League object's properties
                    if let leagues = jsonData.result {
//                        for league in leagues {
//                            print("League Key: \(league.leagueKey ?? 0), League Name: \(league.leagueName ?? ""), Country Key: \(league.countryKey ?? 0), Country Name: \(league.countryName ?? ""), League Image: \(league.leagueImg ?? ""), Country Image: \(league.countryImg ?? "")")
//                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Request failed: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func fetchLeaguesResult(sport: String, compilitionHandler: @escaping (LeagueResponse?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c")
        
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(LeagueResponse.self, from: data ?? Data())
                compilitionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                compilitionHandler(nil)
            }
            
        }
        task.resume()
        
    }
    
    

    }

