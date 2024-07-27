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
    var artworkListCoordinator: ArtworkListCoordinator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        
        let homeNavigationController = UINavigationController()
        self.homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        
        let artworkListNavigationController = UINavigationController()
        self.artworkListCoordinator = ArtworkListCoordinator(navigationController: artworkListNavigationController)
    }
    
    func start() {
        homeCoordinator.start()
        artworkListCoordinator.start()
        
        tabBarController.viewControllers = [
            homeCoordinator.navigationController,
            artworkListCoordinator.navigationController,
        ]
        
        navigationController.viewControllers = [tabBarController]
    }
}
