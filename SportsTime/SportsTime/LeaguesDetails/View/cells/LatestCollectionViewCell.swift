//
//  LatestCollectionViewCell.swift
//  SportsTime
//
//  Created by raneem on 26/04/2024.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var enemyName: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    
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
