//
//  FavourtiteViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 29/04/2024.
//

import UIKit
import Kingfisher

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    
    var favLeagues :[League] = []
    var presenter = FavoritePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        favLeagues = presenter.getAllFav()
        self.favTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
  
func showAlert(title: String, message: String, index:IndexPath) {
     
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
   
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.deleteFromFav(indexPath: index)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true)
        }
    
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
       
        self.present(alertController, animated: true, completion: nil)
    }


}


extension FavoriteViewController : UITableViewDelegate , UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return favLeagues.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var league = favLeagues[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavoriteTableViewCell
        cell.leagueName.text = league.league_name
        KF.url(URL(string: league.league_logo ?? ""))
                    .placeholder(UIImage(named: "lg.png"))
                    .set(to: cell.leagueImg)
        return cell
    }
 
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        showAlert(title: "Caution!", message: "Are you sure you want to delete ?",index: indexPath)
            self.favTableView.reloadData()
        }
    }
    
    func deleteFromFav(indexPath:IndexPath){
        
       favTableView.beginUpdates()
       favLeagues.remove(at: indexPath.section)
       favTableView.deleteSections(IndexSet(integer: indexPath.section), with:.fade)
        presenter.deleteFromFav(leagueIndex: favLeagues[indexPath.row].league_key!)
       favTableView.endUpdates()
       
        
    }
}




extension FavoriteViewController : FavouriteProtocol {
    
    func updateFavView(leagues: [League]) {
        self.favLeagues = leagues
        self.favTableView.reloadData()
    }
}