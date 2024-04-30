//
//  TeamsTableViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 25/04/2024.
//

import UIKit
import Kingfisher

class TeamsTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource ,UICollectionViewDelegateFlowLayout, TeamsProtocol {
    
    @IBOutlet weak var teamDetailsName: UILabel!
    @IBOutlet weak var teamDetailsImage: UIImageView!
    
    var team :Team?
    var players :[Player] = []
    
    let presenter = TeamsPresenter()
    
    override func viewDidLoad() {
        
        presenter.attachView(view: self)
        presenter.getTeam(teamKey:Int((team?.teamKey)!).description)
        players = (team?.players)!
    
        
        KF.url(URL(string: team?.teamLogo ?? ""))
            .placeholder(UIImage(named: "Barcelona"))
            .set(to:teamDetailsImage)
        teamDetailsName.text = team?.teamName!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        players.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell") as! PlayerTableViewCell
        cell.playerName.text = player.playerName
        cell.playerRate.text = player.playerRating
        
      
        KF.url(URL(string: player.playerImage ?? ""))
            .placeholder(UIImage(named: "banzema"))
            .set(to: cell.playerImgView)
        return cell
    }
    
    func updateView(team: TeamResponse) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    

    
}
