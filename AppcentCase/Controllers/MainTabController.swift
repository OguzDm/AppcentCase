//
//  MainTabController.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 12.08.2021.
//

import UIKit

final class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        tabBar.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }
    
    private func configureViewControllers(){
        
        let curiosityVC = CuriosityViewController()
        let nav = templateNavigationController(image: UIImage(systemName: "eyes")!, rootViewController: curiosityVC,text: "Curiosity")
        
        let opportunityVC = OpportunityViewController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "paperplane")!, rootViewController: opportunityVC,text: "Opportunity")
        
        let spiritVC = SpiritViewController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "leaf")!, rootViewController: spiritVC,text: "Spirit")
        
        viewControllers = [nav,nav2,nav3]
    }
    
    private func templateNavigationController(image:UIImage,rootViewController: UIViewController,text: String) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.tabBarItem.title = text
        nav.isNavigationBarHidden = true
        
        return nav
    }
}
