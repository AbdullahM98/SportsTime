//
//  TeamsTableViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 25/04/2024.
//

import UIKit

class TeamsTableViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    override func viewDidLoad() {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell")
        return cell!
    }
    


}
