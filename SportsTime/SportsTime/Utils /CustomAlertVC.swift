//
//  CustomAlertVC.swift
//  SportsTime
//
//  Created by Abdullah Essam on 30/04/2024.
//

import UIKit

protocol AlertProtocol {
    func yesBtn(index:IndexPath)
  
}
class CustomAlertVC: UIViewController {
    
    var delegate :AlertProtocol?
    var index :IndexPath?
    
    @IBAction func yesBtn(_ sender: Any) {
        delegate?.yesBtn(index: index!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}
