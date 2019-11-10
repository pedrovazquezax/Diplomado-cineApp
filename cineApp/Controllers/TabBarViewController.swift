//
//  TabBarViewController.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 9/28/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
                let controller = BillboardCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let billboardController = UINavigationController(rootViewController: controller)
                billboardController.tabBarItem.image = UIImage(named: "movie")
                billboardController.tabBarItem.title = "Peliculas"
        
        let shopController = ShopTableViewController()
        let shopTableViewController = UINavigationController(rootViewController: shopController)
        shopTableViewController.tabBarItem.image = UIImage(named: "shop")
        shopTableViewController.tabBarItem.title = "Tienda"

                
              

                tabBar.tintColor = UIColor.init(red: 4/255, green: 61/255, blue: 82/255, alpha: 1)
                viewControllers = [billboardController,shopTableViewController]

    }

}
