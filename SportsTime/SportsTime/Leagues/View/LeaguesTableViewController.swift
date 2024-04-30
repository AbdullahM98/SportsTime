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

class LeaguesTableViewController: UIViewController, UITableViewDelegate , UITableViewDataSource,LeagueProtocol {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var leaguesArray: [League] = []
    var sportsType : String = ""
    let presenter = LeaguePresenter()
    var isSearching = false
    var searchingList :[League] = []
    
    @IBOutlet weak var leaguesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.getLeaguesNetwork()
        print("LeagueName ",sportsType)
    }
    override func viewWillAppear(_ animated: Bool) {
        leaguesTableView.reloadData()

    }
    func updateLeagues(res:LeagueResponse) {
        self.leaguesArray = res.result!
        DispatchQueue.main.async {
            print("from updata",self.leaguesArray.count)
            self.leaguesTableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
         if isSearching{
             return searchingList.count
         }else{
             return leaguesArray.count
         }
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueId = leaguesArray[indexPath.section].league_key
        let leagueName = leaguesArray[indexPath.section].league_name
        let leagueeType = sportsType
        let selectedLeague = leaguesArray[indexPath.section]
        
        if let DetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as? LeaguesDetailsViewController {
            DetailsViewController.selctedLeague = selectedLeague
            DetailsViewController.leagueId = leagueId
            DetailsViewController.sportsType = sportsType

            navigationController?.pushViewController(DetailsViewController, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
   
    
   
    
   
}

extension LeaguesTableViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        isSearching = true
        if !searchText.isEmpty {
           
            searchingList = leaguesArray.filter({($0.league_name?.prefix(searchText.count))! == searchText})
        
            for league in searchingList{
                print("filtered name : \(league.league_name!)")
            }
        }
        
        self.leaguesTableView.reloadData()

        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        self.leaguesTableView.reloadData()
    }
}

// $0.league_name?.prefix(searchText.count))! == searchText
