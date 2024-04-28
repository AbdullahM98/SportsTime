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
    

    
}
