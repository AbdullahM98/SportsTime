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
    
    
    
     func insertLeagueToFavorite(league:League) {
         let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext!)
        let movie = NSManagedObject(entity: entity!, insertInto: managedContext)
        movie.setValue(league.league_key, forKey: "league_key")
        movie.setValue(league.league_name, forKey: "league_name")
        movie.setValue(league.league_logo, forKey: "league_logo")

        print("success favorite ",league.league_name as Any)
        
        do{
            try
            DataBaseManger.context.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    
    
    func getAllLeagues() ->[League]{
        
        var result:[League] = []
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        do{
            var fetchedList = try managedContext?.fetch(request)
            guard let list = fetchedList else{return []}
           
            for leaguee in list{
                var league = League()
                league.league_key = leaguee.value(forKey: "league_key") as? Int
                league.league_name = leaguee.value(forKey: "league_name") as? String
                league.league_logo = leaguee.value(forKey: "league_logo") as? String
                print("fetched \(league.league_name)")
                result.append(league)
            }
        }catch let error as NSError{
            print(error)
        }
        for item in result{
            print("fetched \(item.league_name)")
        }
        return result
      
    }
    
    func deleteLeagueFromFav(leagueId:Int){
        var obj : NSManagedObject?
        do {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
            var  fetchedList = try managedContext?.fetch(fetchRequest)
           
                 obj = fetchedList?.first(where: {
                   
                    $0.value(forKey: "league_key") as! Int == leagueId
                    
                })
            
            
            managedContext?.delete(obj!)
            try managedContext?.save()
        }catch let error as NSError{
            print(error)
        }
        
    }
}
