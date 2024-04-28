//
//  LocalDataSource.swift
//  SportsTime
//
//  Created by Abdullah Essam on 28/04/2024.
//

import UIKit
import CoreData

class LocalDataSource {
    static let shared = LocalDataSource()
    let entityName = "FavLeague"
    var managedContext : NSManagedObjectContext?
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func getAllLeagues() ->[League]{
        
        var result:[League] = []
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do{
            var fetchedList = try managedContext?.fetch(request)
            guard let list = fetchedList else{return []}
            var league = League()
            for leaguee in list{
                
                league.league_key = leaguee.value(forKey: "league_key") as? Int
                league.league_name = leaguee.value(forKey: "league_name") as? String
                league.country_name = leaguee.value(forKey: "country_name") as? String
                league.country_key = leaguee.value(forKey: "country_key") as? Int
                league.league_logo = leaguee.value(forKey: "league_logo") as? String
                league.country_logo = leaguee.value(forKey: "country_logo") as? String
                
                result.append(league)
            }
        }catch let error as NSError{
            print(error)
        }
           
        return result
      
    }
    
    func deleteMovie(leagueIndex:Int){

        do {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
            var  fetchedList = try managedContext?.fetch(fetchRequest)
            managedContext?.delete((fetchedList?[leagueIndex])!)
            try managedContext?.save()
        }catch let error as NSError{
            print(error)
        }
        
    }
}
