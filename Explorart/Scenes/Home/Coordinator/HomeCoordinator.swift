//
//  HomeCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.title = "Home"
        viewController.tabBarItem = UITabBarItem(title: "Home",
                                                 image: UIImage(systemName: "house"),
                                                 tag: 0)
        navigationController.pushViewController(viewController, animated: false)
    }
}
