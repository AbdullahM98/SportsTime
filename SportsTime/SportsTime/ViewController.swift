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
        ApiServices.shared.fetchLeagues(completion: {
            res in
            print(res)
        })
    }

    @IBAction func btn(_ sender: Any) {
    }
    
}

