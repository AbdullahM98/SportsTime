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
        
        var searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.frame = CGRect(x: 0, y: -50, width: view.bounds.width, height: 40)
        searchController.searchBar.backgroundColor = UIColor.purple
        searchController.searchBar.barTintColor = UIColor.white
        presenter.attachView(view: self)
        presenter.getLeaguesNetwork()
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
         let league =  leaguesArray[indexPath.section]
        
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
             DetailsViewController.leagueName = leagueName
             DetailsViewController.sportsType = sportsType
           
            
             if(sportsType == "tennis"){
                 showAlert(title: "No Details For Tennis ", message: "please choosen another Sport ", index: indexPath)
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
//        isSearching = true
//        print("didd")
//        if !searchText.isEmpty {
//            
//            searchingList = leaguesArray.filter({($0.league_name?.prefix(searchText.count))! == searchText})
//            print("search list is \(searchingList.count)")
//        }else{
//        searchingList = leaguesArray
//        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
      print("here")
        isSearching = true
            if let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty {
                
        searchingList = leaguesArray.filter { league in
                    return league.league_name!.localizedCaseInsensitiveContains(searchText)
               }
             
            }else{
                searchingList = leaguesArray
            }
        self.leaguesTableView.reloadData()
        }
    
    
    
    
    func showAlert(title: String, message: String, index:IndexPath) {
       
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
      
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel Pressed")
        }
        
   
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
       
        self.present(alertController, animated: true, completion: nil)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        self.leaguesTableView.reloadData()
    }
}
