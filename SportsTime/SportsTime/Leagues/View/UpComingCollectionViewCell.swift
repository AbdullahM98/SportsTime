//
//  UpComingCollectionViewCell.swift
//  SportsTime
//
//  Created by raneem on 25/04/2024.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var enemyLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
                backgroundImageView.contentMode = .scaleAspectFill
                backgroundImageView.clipsToBounds = true
                backgroundImageView.layer.cornerRadius = 25
                backgroundImageView.layer.shadowColor = UIColor.black.cgColor
                backgroundImageView.layer.shadowOpacity = 0.8
                backgroundImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
                backgroundImageView.layer.shadowRadius = 8
                
                addSubview(backgroundImageView)
                sendSubviewToBack(backgroundImageView)
                
                backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
            }
}
