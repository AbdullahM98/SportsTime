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
}


class LeaguesDetailsViewController: UICollectionViewController,LeagueDetailsProtocol{
    
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
    
    let presenter = DetailsPresenter()
    var selctedLeague : League?
    var leagueId :Int!
    var UpComingArray : [Fixtures] = []
    var LatestEventsArray : [Fixtures] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let leagueId = leagueId {
            presenter.attachView(view: self)
            presenter.getUpComingEvents(leagueId:leagueId)
            presenter.getLatestEvents(leagueId:leagueId)
            
            print("league_key details ",selctedLeague?.league_key as Any ,(String(format :"%d" ,leagueId)))
            
            let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
                switch(sectionIndex){
                case 0 :
                    return self.upComingEvents()
                default:
                    return self.latestEvents()
                }
            }
            collectionView.setCollectionViewLayout(layout, animated: true)
            
        }
    }
    override func viewWillAppear(_ animated: Bool){
        collectionView.reloadData()
    }
    func upComingEvents()->NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension:        .fractionalWidth(1), heightDimension: .absolute(220))
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
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return UpComingArray.count
        case 1:
            return LatestEventsArray.count
        default:
            return 0
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as! UpComingCollectionViewCell
            
            cell.homeLabel.text = UpComingArray[indexPath.row].event_home_team
            
            KF.url(URL(string: UpComingArray[indexPath.row].home_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: cell.homeImage)
            
            KF.url(URL(string: UpComingArray[indexPath.row].away_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: cell.enemyImage)
            
            cell.enemyLabel.text = UpComingArray[indexPath.row].event_away_team
            cell.dateLabel.text = UpComingArray[indexPath.row].event_date
            cell.hourLabel.text = UpComingArray[indexPath.row].event_time
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCollectionViewCell
            
            cell.homeName.text = LatestEventsArray[indexPath.row].event_home_team
            
            KF.url(URL(string: LatestEventsArray[indexPath.row].home_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: cell.homeImage)
            
            KF.url(URL(string: LatestEventsArray[indexPath.row].away_team_logo ?? ""))
                .placeholder(UIImage(named: "lg.png"))
                .set(to: cell.enemyImage)
            
            cell.enemyName.text = LatestEventsArray[indexPath.row].event_away_team
            cell.eventDate.text = LatestEventsArray[indexPath.row].event_date
            cell.eventTime.text = LatestEventsArray[indexPath.row].event_time
            cell.score.text = LatestEventsArray[indexPath.row].event_final_result
            
            return cell
        }
        
    }
    
}
