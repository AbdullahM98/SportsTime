//
//  HomeCollectionCustomCell.swift
//  SportsTime
//
//  Created by Abdullah Essam on 23/04/2024.
//

import UIKit

class HomeCollectionCustomCell: UICollectionViewCell {

    @IBOutlet weak var sportImg: UIImageView!
    
    @IBOutlet weak var titleText: UILabel!
    
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            configureAppearance()
        }
        
        func configureAppearance() {
            
            layer.borderColor = UIColor.blue.cgColor
            layer.borderWidth = 1.0
        }
}
