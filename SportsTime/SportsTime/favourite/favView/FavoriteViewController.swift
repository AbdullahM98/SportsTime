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
    
    @IBOutlet weak var emptyFav: UIImageView!
    var favLeagues :[League] = []
    var presenter = FavoritePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "FavTableViewCell", bundle: nil)
        self.favTableView.register(nibCell, forCellReuseIdentifier: "FavCell")
        self.navigationItem.hidesBackButton = true
        
        presenter.view = self
        favLeagues = presenter.getAllFav()
        isFavEmpty()
        self.favTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
        favLeagues = presenter.getAllFav()
        isFavEmpty()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        isFavEmpty()
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
        let league = favLeagues[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavTableViewCell
        cell.favLeagueName.text = league.league_name
        KF.url(URL(string: league.league_logo ?? ""))
                    .placeholder(UIImage(named: "games"))
                    .set(to: cell.favLeagueImage)
        
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var league = favLeagues[indexPath.section]
        let DVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
        DVC.selctedLeague = league
        DVC.leagueId = league.league_key
        DVC.leagueName = league.league_name
        
        if ReachabilityNetwork.shared.isNetworkAvailable{
            navigationController?.pushViewController(DVC, animated: true)
        }else{
            showAlert(title: "No Interner Connection ", message: "please check your network connection "){
                self.dismiss(animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            showAlert(title: "Caution!", message: "Are you sure you want to delete ?" ){
                self.deleteFromFav(indexPath: indexPath)
                
            }
            self.favTableView.reloadData()
        }
    }
    
    func deleteFromFav(indexPath:IndexPath){
       presenter.deleteFromFav(leagueIndex: favLeagues[indexPath.section].league_key!)
       favTableView.beginUpdates()
       favLeagues.remove(at: indexPath.section)
       favTableView.deleteSections(IndexSet(integer: indexPath.section), with:.fade)
       favTableView.endUpdates()
       isFavEmpty()
        
    }
    
    func isFavEmpty(){
        if favLeagues.isEmpty {
            self.favTableView.isHidden = true
            self.emptyFav.isHidden = false
            self.favTableView.reloadData()

            
        }else{
            self.favTableView.isHidden = false
            self.emptyFav.isHidden = true
            self.favTableView.reloadData()
        }
    }
}

extension FavoriteViewController : FavouriteProtocol {
    
    func updateFavView(leagues: [League]) {
        self.favLeagues = leagues
        self.favTableView.reloadData()
    }
    

}
