//
//  FavPresenterProtocol.swift
//  SportsTime
//
//  Created by Abdullah Essam on 02/05/2024.
//

import Foundation
import UIKit
protocol FavPresenterProtocol{
    
    func getAllFav()->[League]
    func deleteFromFav(leagueIndex:Int)
    func attachView(view:FavouriteProtocol)

 
}

protocol FavTableViewDelegation {
    
    func updateList()
    func tableViewNumberOfRowsInSection(section:Int) ->Int
    func tableViewNumberOfSections(tableView: UITableView) -> Int
    func tableViewCell(tableView:UITableView,indexPath: IndexPath) ->UITableViewCell
    func navigateToLeagueDetails(indexPath:IndexPath)
    func tableViewHandleSwipeAction( indexPath: IndexPath)
}


