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
    var leaguesArray: [League] = []
    var searchingList :[League] = []
    var sportsType : String = ""
    let presenter = LeaguePresenter()
    var isSearching = false
    var activiyIndicator  = UIActivityIndicatorView()
    

    
    @IBOutlet weak var leaguesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.currSport
        
        activiyIndicator.center = self.view.center
        activiyIndicator.hidesWhenStopped = true
        activiyIndicator.style = .large
        activiyIndicator.color = UIColor.blue
        view.addSubview(activiyIndicator)
        activiyIndicator.startAnimating()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.frame = CGRect(x: 0, y: -50, width: view.bounds.width, height: 40)
        searchController.searchBar.backgroundColor = UIColor(named: "grayColor")
        searchController.searchBar.barTintColor = UIColor.white
        presenter.attachView(view: self)
        presenter.getLeaguesNetwork()
        
        
        if let navigationBar = self.navigationController?.navigationBar {
                navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        leaguesTableView.reloadData()
     

    }
    func updateLeagues(res:LeagueResponse) {
        self.leaguesArray = res.result!
        DispatchQueue.main.async {
            self.leaguesTableView.reloadData()
            self.activiyIndicator.stopAnimating()

        }
        
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
         isSearching ? searchingList.count : leaguesArray.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath)
         
         cell.layer.cornerRadius = 25
         cell.layer.cornerRadius = 25
         cell.layer.borderWidth = 1
         cell.layer.borderColor = UIColor.blue.cgColor
         if isSearching {
             let searchLeague =  searchingList[indexPath.section]
             cell.textLabel?.text = searchLeague.league_name
             if let logoURLString = searchLeague.league_logo, let logoURL = URL(string: logoURLString) {
                 cell.imageView?.sd_setImage(with: logoURL, placeholderImage: UIImage(named: "uefa"))
             }
             cell.imageView!.layer.cornerRadius = cell.imageView!.frame.size.width / 2
             cell.imageView!.clipsToBounds = true
             return cell
         }else{
             let league =  leaguesArray[indexPath.section]
             
             cell.textLabel?.text = league.league_name
             if let logoURLString = league.league_logo, let logoURL = URL(string: logoURLString) {
                 cell.imageView?.sd_setImage(with: logoURL, placeholderImage: UIImage(named: "uefa"))
             }
             cell.imageView!.layer.cornerRadius = cell.imageView!.frame.size.width / 2
             cell.imageView!.clipsToBounds = true
             
             return cell
         }
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
             DetailsViewController.leagueName = leagueName
             DetailsViewController.sportsType = sportsType
           
            
             if(sportsType == "tennis"){
                 showAlert(title: "No Details For Tennis ", message: "please choosen another Sport ")
             }else{
                 navigationController?.pushViewController(DetailsViewController, animated: true)
             }
         }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
   
    
   
    
   
}

extension LeaguesTableViewController : UISearchBarDelegate , UISearchResultsUpdating{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        if !searchText.isEmpty {
            searchingList = leaguesArray.filter { $0.league_name?.range(of: searchText, options: .caseInsensitive) != nil }
        } else {
            searchingList = leaguesArray
        }
        self.leaguesTableView.reloadData()
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        isSearching = true
        if let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty {
            searchingList = leaguesArray.filter { $0.league_name!.localizedCaseInsensitiveContains(searchText) }
        } else {
            searchingList = leaguesArray
        }
        self.leaguesTableView.reloadData()
    }
   
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        self.leaguesTableView.reloadData()
    }
}
