//
//  TeasmCollectionViewCell.swift
//  SportsTime
//
//  Created by Abdullah Essam on 27/04/2024.
//

import UIKit

class TeasmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamImgView: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
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
