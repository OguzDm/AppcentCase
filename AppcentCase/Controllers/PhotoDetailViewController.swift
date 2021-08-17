//
//  PhotoDetailViewController.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 14.08.2021.
//

import UIKit
import Kingfisher

final class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var roverImageView: UIImageView!
    @IBOutlet weak var roverNameLabel: UILabel!
    @IBOutlet weak var photoDateLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var landingDateLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
    
    var name = ""
    var image = ""
    var date = ""
    var launchDate = ""
    var landingDate = ""
    var camera = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let imageURL = URL(string: image) else {return}
        roverNameLabel.text = name
        roverImageView.kf.indicatorType = .activity
        roverImageView.kf.setImage(with: imageURL)
        roverImageView.layer.cornerRadius = 32
        roverImageView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        photoDateLabel.text = DateFormatter().convertDateFormater(date)
        launchDateLabel.text = DateFormatter().convertDateFormater(launchDate)
        landingDateLabel.text = DateFormatter().convertDateFormater(landingDate)
        cameraLabel.text = camera
    }
}
