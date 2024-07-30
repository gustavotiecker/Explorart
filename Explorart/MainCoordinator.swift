//
//  MainCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var homeCoordinator: HomeCoordinator
    var toursCoordinator: ToursCoordinator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        
        let homeNavigationController = UINavigationController()
        self.homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        
        let toursNavigationController = UINavigationController()
        self.toursCoordinator = ToursCoordinator(navigationController: toursNavigationController)
    }
    
    func start() {
        homeCoordinator.start()
        toursCoordinator.start()
        
        tabBarController.viewControllers = [
            homeCoordinator.navigationController,
            toursCoordinator.navigationController,
        ]
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [tabBarController]
    }
}
