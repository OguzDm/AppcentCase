//
//  OpportunityViewController.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 12.08.2021.
//

import UIKit

final class OpportunityViewController: UIViewController,FilterViewControllerDelegate {
    
    func didUpdateFilter(filter: String) {
        queryParams["camera"] = filter
        currentPage = 1
        self.PHOTOS.removeAll()
        Service.shared.fetchRequest(rover: .Opportunity,queryParams: queryParams,page: currentPage,sol: sol) { rover in
            self.PHOTOS.append(contentsOf: rover.photos)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private var collectionView: UICollectionView!
    private var PHOTOS = [RoverPhotos]()
    private var sol = 1
    private var currentPage = 1
    private var queryParams = ["api_key":Constants.apiKEY]
    private let activeCameras = ["FHAZ","RHAZ","NAVCAM","PANCAM","MINITES"]
    
    private let filterButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        button.backgroundColor = .white
        button.setImage(UIImage(named: "filter"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureCircleButton(button: filterButton, size: 60)
        filterButton.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
        Service.shared.fetchRequest(rover: .Opportunity,queryParams: queryParams, page: 1,sol: sol) { rover in
            self.PHOTOS.append(contentsOf: rover.photos)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc private func filterButtonAction(){
        let filterVC = FilterViewController()
        filterVC.activeCameras = activeCameras
        filterVC.delegate = self
        present(filterVC, animated: true, completion: nil)
    }
    
    private func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UINib.loadNib(name: RoverCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: RoverCollectionViewCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
}

extension OpportunityViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == PHOTOS.count - 2 {
            currentPage += 1
            Service.shared.fetchRequest(rover: .Opportunity,queryParams: queryParams, page: currentPage,sol: sol) { rover in
                self.PHOTOS.append(contentsOf: rover.photos)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        preparePhotoDetailVC(with: PHOTOS[indexPath.item])
    }
}

extension OpportunityViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PHOTOS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoverCollectionViewCell.reuseIdentifier, for: indexPath) as! RoverCollectionViewCell
        
        cell.configure(image: PHOTOS[indexPath.item].imgSrc)
        
        return cell
    }
}
