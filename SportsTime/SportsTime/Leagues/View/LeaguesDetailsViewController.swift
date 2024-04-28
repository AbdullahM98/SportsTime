//
//  LeaguesDetailsViewController.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import UIKit
import Kingfisher

protocol LeagueDetailsProtocol{
    func updateUpComing(fixtures:FixturesResponse)
    func updateLatest(fixtures:FixturesResponse)
    func updateTeams(teams:TeamResponse) 
}


class LeaguesDetailsViewController: UICollectionViewController,LeagueDetailsProtocol{
    let presenter = DetailsPresenter()
    var selctedLeague : League?
    var leagueId :Int!
    var UpComingArray : [Fixtures] = []
    var LatestEventsArray : [Fixtures] = []
    var teamsArray : [Team] = []
    
    
    func updateUpComing(fixtures: FixturesResponse) {
        if let result = fixtures.result{
            self.UpComingArray = result
            DispatchQueue.main.async {
                print("from updata UpComingArray",self.UpComingArray.count)
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    func updateLatest(fixtures: FixturesResponse) {
        if let result = fixtures.result{
            self.LatestEventsArray = result
            DispatchQueue.main.async {
                print("from updata LatestEventsArray",self.LatestEventsArray[0].event_final_result)
                self.collectionView.reloadData()
            }
        }
    }
    
    func updateTeams(teams:TeamResponse){
        if let res = teams.result{
            self.teamsArray = res
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let leagueId = leagueId {
            presenter.attachView(view: self)
            presenter.getUpComingEvents(leagueId:leagueId)
            presenter.getLatestEvents(leagueId:leagueId)
            presenter.getTeamsLeague(leagueId: String(leagueId), met: "Teams", sport: "football")
            
            print("league_key details ",selctedLeague?.league_key as Any ,(String(format :"%d" ,leagueId)))
            
            let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
                switch(sectionIndex){
                case 0 :
                    return self.upComingEvents()
                case 1 :
                    return self.latestEvents()
                case 2 :
                    return self.leagueTeams()
                default:
                    return self.leagueTeams()
                }
            }
            collectionView.setCollectionViewLayout(layout, animated: true)
            
        }
    }
    override func viewWillAppear(_ animated: Bool){
        collectionView.reloadData()
    }
 
    
    func latestEvents() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                               , heightDimension: .absolute(180))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                                                     , subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                                                      , bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
                                                        , bottom: 50, trailing: 15)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        return section
    }
    
    func upComingEvents()->NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [headerSupplementary]
        
        
        return section
    }
    
    func leagueTeams() -> NSCollectionLayoutSection{
        
        //item
        let itemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalWidth(0.5))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
                                               
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])


        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                                               
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
    //    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
//
//        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(10))
//        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
//                                               
//        section.boundarySupplementaryItems = [headerSupplementary]
                                        
            //return
            return section

        
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return UpComingArray.count
        case 1:
            return LatestEventsArray.count
        case 2 :
            return teamsArray.count
        default:
            return 0
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            var currTeam = teamsArray[indexPath.row]
            if let TeamsTableViewController = storyboard?.instantiateViewController(withIdentifier: "TeamsTableViewController") as? TeamsTableViewController {
                TeamsTableViewController.team = currTeam
               
                
                navigationController?.pushViewController(TeamsTableViewController, animated: true)
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upcomingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCollectionViewCell
        
        let latesstCell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCollectionViewCell
        
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionCell", for: indexPath) as!TeasmCollectionViewCell
        switch (indexPath.section) {
        case 0:
           
            
            upcomingCell.homeLabel.text = UpComingArray[indexPath.row].event_home_team
            
            KF.url(URL(string: UpComingArray[indexPath.row].home_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: upcomingCell.homeImage)
            
            KF.url(URL(string: UpComingArray[indexPath.row].away_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: upcomingCell.enemyImage)
            
            upcomingCell.enemyLabel.text = UpComingArray[indexPath.row].event_away_team
            upcomingCell.dateLabel.text = UpComingArray[indexPath.row].event_date
            upcomingCell.hourLabel.text = UpComingArray[indexPath.row].event_time
            
           
        case 1 :
         
            
            latesstCell.homeName.text = LatestEventsArray[indexPath.row].event_home_team
            
            KF.url(URL(string: LatestEventsArray[indexPath.row].home_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: latesstCell.homeImage)
            
            KF.url(URL(string: LatestEventsArray[indexPath.row].away_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: latesstCell.enemyImage)
            
            latesstCell.enemyName.text = LatestEventsArray[indexPath.row].event_away_team
            latesstCell.eventDate.text = LatestEventsArray[indexPath.row].event_date
            latesstCell.eventTime.text = LatestEventsArray[indexPath.row].event_time
            latesstCell.score.text = LatestEventsArray[indexPath.row].event_final_result
            
        case 2:
        
            KF.url(URL(string: teamsArray[indexPath.row].teamLogo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: teamCell.teamImgView)
        default :
            latesstCell
           
        }
        switch indexPath.section{
        case 0:
            return upcomingCell
        case 1:
            return latesstCell
        case 2:
            return teamCell
        default :
            return teamCell
        }
    }
    
}