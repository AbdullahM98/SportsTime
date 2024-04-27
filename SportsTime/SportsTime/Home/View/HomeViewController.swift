//
//  HomeViewController.swift
//  SportsTime
//
//  Created by raneem on 22/04/2024.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    let names = ["Football","Tennis","Cricket","Basketball"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCustomCell", for: indexPath) as! HomeCollectionCustomCell
        cell.sportImg.image = UIImage(named: names[indexPath.row])
        cell.titleText.text = names[indexPath.row]
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let legues = storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaguesTableViewController
        
        switch(names[indexPath.row]){
        case "Football":
            legues.LeagueName = "Football"
            Constants.currSport = Sports.football.rawValue
        case "Basketball":
            legues.LeagueName = "Basketball"
            Constants.currSport = Sports.basketball.rawValue
        case "Cricket":
            legues.LeagueName = "Cricket"
            Constants.currSport = Sports.cricket.rawValue
        case "Tennis":
            legues.LeagueName = "Tennis"
            Constants.currSport = Sports.tennis.rawValue
        default:
            break
        }
        self.navigationController?.pushViewController(legues, animated: true)

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
