//
//  Extension+UIViewController.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 16.08.2021.
//

import UIKit

extension UIViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.65))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 16, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .fractionalWidth(0.65))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 16
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func preparePhotoDetailVC(with result: RoverPhotos) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "PhotoDetailViewController") as? PhotoDetailViewController else {
             fatalError("instantiate issue")
         }
         detailVC.image = result.imgSrc
         detailVC.name = result.rover.name
         detailVC.date = result.earthDate
         detailVC.launchDate = result.rover.launchDate
         detailVC.landingDate = result.rover.landingDate
         detailVC.camera = result.camera.name
         present(detailVC, animated: true, completion: nil)
    }
    
    func configureCircleButton(button: UIButton,size: CGFloat) {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: size),
            button.widthAnchor.constraint(equalToConstant: size),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
        ])
        button.layer.cornerRadius = size / 2
    }
}
