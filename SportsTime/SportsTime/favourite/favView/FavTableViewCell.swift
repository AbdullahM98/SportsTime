//
//  FavTableViewCell.swift
//  SportsTime
//
//  Created by raneem on 02/05/2024.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var favLeagueName: UILabel!
    @IBOutlet weak var favLeagueImage: UIImageView!
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    
}
