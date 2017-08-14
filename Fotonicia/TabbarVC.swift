//
//  TabbarVC.swift
//  Fotonicia
//
//  Created by sawan on 17/07/17.
//  Copyright © 2017 Zatak Softech. All rights reserved.
//

import UIKit


class TabBarVC: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let layout = UICollectionViewFlowLayout()
        
        let dashboard = HomeVC(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: dashboard)
        navigationController.tabBarItem.image = UIImage(named: "home")
        navigationController.tabBarItem.selectedImage = UIImage(named: "bookfill")
        navigationController.tabBarItem.title = "Home"
      
      
        
        let shop = offersVc(collectionViewLayout: layout)
        let secondNavigationController = UINavigationController(rootViewController: shop)
        secondNavigationController.tabBarItem.image = UIImage(named: "offer")
        secondNavigationController.tabBarItem.selectedImage = UIImage(named: "bookfill")
         secondNavigationController.tabBarItem.title = "Offers"
        
        let video = refer_earnVC()
        let thirdNavigationController = UINavigationController(rootViewController: video)
        thirdNavigationController.tabBarItem.image = UIImage(named: "earn")
        thirdNavigationController.tabBarItem.selectedImage = UIImage(named: "bookfill")
        thirdNavigationController.tabBarItem.title = "Refer & Earn"
        
        if UserDefaults.getUserLoginStatus() {
            
            let more = myAccountVC()
            let fourthNavigationController = UINavigationController(rootViewController: more)
            fourthNavigationController.tabBarItem.image = UIImage(named: "account")
            fourthNavigationController.tabBarItem.selectedImage = UIImage(named: "bookfill")
            fourthNavigationController.tabBarItem.title = "Account"
            
          viewControllers = [navigationController,secondNavigationController,thirdNavigationController,fourthNavigationController]
        } else {
            
            let more = LogInVC()
            let fourthNavigationController = UINavigationController(rootViewController: more)
            fourthNavigationController.tabBarItem.image = UIImage(named: "account")
            fourthNavigationController.tabBarItem.selectedImage = UIImage(named: "bookfill")
            fourthNavigationController.tabBarItem.title = "Login"
            viewControllers = [navigationController,secondNavigationController,thirdNavigationController,fourthNavigationController]
        }
        
    }
}
