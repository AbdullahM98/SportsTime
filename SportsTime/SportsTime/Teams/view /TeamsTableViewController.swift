//
//  TeamsTableViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 25/04/2024.
//

import UIKit
import Kingfisher

class TeamsTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource ,UICollectionViewDelegateFlowLayout, TeamsProtocol {
    var team :Team?
    var players :[Player] = []
    
    let presenter = TeamsPresenter()
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        presenter.getTeam(teamKey:Int((team?.teamKey)!).description)
        players = (team?.players)!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell") as! PlayerTableViewCell
        cell.playerName.text = player.playerName
        cell.playerRate.text = player.playerRating
        
      
        KF.url(URL(string: player.playerImage ?? ""))
            .placeholder(UIImage(named: "lg.png"))
            .set(to: cell.playerImgView)
        return cell
    }
    
    func updateView(team: TeamResponse) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    

    
}
