//
//  LeaguesTableViewController.swift
//  SportsTime
//
//  Created by raneem on 24/04/2024.
//

import UIKit
import Kingfisher
import SDWebImage

class LeaguesTableViewController: UITableViewController {
    var leaguesArray: [League] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLeagues()
    }
    func fetchLeagues() {
        ApiServices.shared.getLeaguesNetwork { leagueResponse in
            if let response = leagueResponse {
                self.leaguesArray = response.result!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Failed to fetch leagues")
            }
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
