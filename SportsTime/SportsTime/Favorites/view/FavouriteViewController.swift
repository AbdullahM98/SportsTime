//
//  FavouriteViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 28/04/2024.
//

import UIKit
import Kingfisher

class FavouriteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , FavoriteProtocol {

    @IBOutlet weak var favTableView: UITableView!
    
    var favLeagues :[League] = []
    var presenter = FavPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        favLeagues = presenter.getAllFav()
        self.favTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favLeagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var league = favLeagues[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavTableViewCell
        cell.leagueName.text = league.league_name
        KF.url(URL(string: league.league_logo ?? ""))
                    .placeholder(UIImage(named: "lg.png"))
                    .set(to: cell.leagueImg)
        return cell
    }
    
    func updateFavView(leagues: [League]) {
        self.favLeagues = leagues
        self.favTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            favLeagues.remove(at: indexPath.row)
            presenter.deleteFromFav(leagueIndex: indexPath.row)
            favTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
