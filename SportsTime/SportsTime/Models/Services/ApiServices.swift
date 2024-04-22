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
    
    
    func fetchLeagues(completion: @escaping(Result<LeagueResponse,Error>) -> Void) {
        
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=2154818a4cbfc9dce69fab6771923c29e937839acc91aee84f9fa924bbbd4d6c")
        AF.request(url!,parameters:nil).validate().response{
            respon in
            switch respon.result{
            case .success(let data):
                do{
                    let jsonData = try JSONDecoder().decode(LeagueResponse.self, from: data!)
                    completion(.success(jsonData))
                    print(jsonData.result)
                  
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))

                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))

            }
            
        }
    }
    
    
    
//
    }

