//
//  PlayerTableViewCell.swift
//  SportsTime
//
//  Created by Abdullah Essam on 27/04/2024.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRate: UILabel!
    @IBOutlet weak var playerImgView: UIImageView!
    override func awakeFromNib() {
                super.awakeFromNib()
                configureAppearance()
            }
            
            func configureAppearance() {
                layer.cornerRadius = 25
                layer.masksToBounds = true
                
                layer.borderColor = UIColor.blue.cgColor
                layer.borderWidth = 1.0
            }
    

}
