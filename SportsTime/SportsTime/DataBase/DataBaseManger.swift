//
//  DataBaseManger.swift
//  SportsTime
//
//  Created by raneem on 28/04/2024.
//

import Foundation
import CoreData
import UIKit


class DataBaseManger{
    
    static let appDelagate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelagate.persistentContainer.viewContext
    static let entity = NSEntityDescription.entity(forEntityName: "FavLeague", in: context)
    
    init(){}
    
    static func insertLeagueToFavorite(league:League,leagueType:String) {
        
        let movie = NSManagedObject(entity: entity!, insertInto: context)
        movie.setValue(league.league_key, forKey: "league_key")
        movie.setValue(league.league_name, forKey: "league_name")
        movie.setValue(league.league_logo, forKey: "league_logo")
        movie.setValue(league.country_key, forKey: "country_key")
        movie.setValue(league.country_name, forKey: "country_name")
        movie.setValue(league.country_logo, forKey: "country_logo")
        

        print(league.league_name as Any)
        
        do{
            try
            DataBaseManger.context.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
}
