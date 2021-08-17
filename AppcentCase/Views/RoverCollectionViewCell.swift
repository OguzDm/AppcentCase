//
//  RoverCollectionViewCell.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 13.08.2021.
//

import UIKit
import Kingfisher

final class RoverCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RoverCollectionViewCell"
    @IBOutlet weak var roverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roverImageView.contentMode = .scaleToFill
        roverImageView.layer.cornerRadius = 8
    }
    
    func configure(image: String){
        guard let imageURL = URL(string: image) else {return}
        roverImageView.kf.indicatorType = .activity
        roverImageView.kf.setImage(with: imageURL)
    }
}
