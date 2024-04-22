//
//  ViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ApiServices.shared.fetchLeaguesResult(sport: "String", compilitionHandler: {
            res in print(res!.result?[2].countryImg)
        })
    }

    @IBAction func btn(_ sender: Any) {
    }
    
}

