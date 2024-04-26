//
//  LeaguesTableViewController.swift
//  SportsTime
//
//  Created by raneem on 24/04/2024.
//

import UIKit
import SDWebImage

protocol LeagueProtocol {
    func updateLeagues(res:LeagueResponse)
}

class LeaguesTableViewController: UITableViewController,LeagueProtocol {
    var leaguesArray: [League] = []
    var LeagueName : String = ""
    let presenter = LeaguePresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.getLeaguesNetwork()
        print("LeagueName",LeagueName)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()

    }
    func updateLeagues(res:LeagueResponse) {
        self.leaguesArray = res.result!
        DispatchQueue.main.async {
            print("from updata",self.leaguesArray.count)
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return leaguesArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath)
        let league = leaguesArray[indexPath.section]
        
        cell.textLabel?.text = league.league_name
        if let logoURLString = league.league_logo, let logoURL = URL(string: logoURLString) {
            cell.imageView?.sd_setImage(with: logoURL, placeholderImage: UIImage(named: "uefa"))
        }
        cell.imageView!.layer.cornerRadius = cell.imageView!.frame.size.width / 2
        cell.imageView!.clipsToBounds = true
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueId = leaguesArray[indexPath.section].league_key
        let leagueName = leaguesArray[indexPath.section].league_name
        let selectedLeague = leaguesArray[indexPath.section]
        if let DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as? LeaguesDetailsViewController {
            DetailsViewController.selctedLeague = selectedLeague
            DetailsViewController.leagueId = leagueId
            
            navigationController?.pushViewController(DetailsViewController, animated: true)
        }
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
   
}
