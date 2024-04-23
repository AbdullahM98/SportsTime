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

