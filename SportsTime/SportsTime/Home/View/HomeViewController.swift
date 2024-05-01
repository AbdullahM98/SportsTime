//
//  HomeViewController.swift
//  SportsTime
//
//  Created by raneem on 22/04/2024.
//

import UIKit

class HomeViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var themeSwitch: UISwitch!
    
    let names = ["Football","Tennis","Cricket","Basketball"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        
    }
        @IBAction func themeAction(_ sender: Any) {
            if #available(iOS 13.0, *){
                let appDelegate = UIApplication.shared.windows.first
                if (sender as AnyObject).isOn {
                    appDelegate?.overrideUserInterfaceStyle = .dark

                    return
                }else {
                    appDelegate?.overrideUserInterfaceStyle = .light
                    return
                }
            }
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        if ReachabilityNetwork.shared.isNetworkAvailable {
        switch(names[indexPath.row]){
        case "Football":
            legues.sportsType = "football"
            Constants.currSport = Sports.football.rawValue
        case "Basketball":
            legues.sportsType = "basketball"
            Constants.currSport = Sports.basketball.rawValue
        case "Cricket":
            legues.sportsType = "cricket"
            Constants.currSport = Sports.cricket.rawValue
        case "Tennis":
            legues.sportsType = "tennis"
            Constants.currSport = Sports.tennis.rawValue
        default:
            break
        }
        self.navigationController?.pushViewController(legues, animated: true)
        } else {
            showAlert(title: "No Internet Connection ", message: "Please check your Network ")
        }

    }
   
        
    
}
