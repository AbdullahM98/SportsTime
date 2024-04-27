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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
