//
//  FilterViewController.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 14.08.2021.
//

import UIKit

protocol FilterViewControllerDelegate {
    func didUpdateFilter(filter: String)
}

final class FilterViewController: UIViewController {
    
    private var tableView: UITableView!
    private var currentFilter = ""
    var activeCameras = [String]()
    var delegate: FilterViewControllerDelegate!
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Filter", for: .normal)
        button.layer.cornerRadius = 28
        button.layer.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureFilterButton()
    }
    
    @objc private func filterButtonAction(){
        if currentFilter == "" {
            let alert = UIAlertController(title: "Error", message: "You try to filter before select the camera type.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            delegate.didUpdateFilter(filter: currentFilter)
            dismiss(animated: true, completion: nil)
        }
    }
    
    private func configureTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }
    
    private func configureFilterButton(){
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 56),
            filterButton.widthAnchor.constraint(equalToConstant:251),
            filterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26)
        ])
        filterButton.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFilter = activeCameras[indexPath.row]
    }
}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeCameras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = activeCameras[indexPath.row]
        cell?.backgroundColor = .white
        cell?.textLabel?.textColor = .black
        
        return cell!
    }
}
