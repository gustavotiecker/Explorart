//
//  ArtworkListCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

final class ArtworkListCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ArtworkListViewController()
        viewController.title = "Artworks"
        viewController.tabBarItem = UITabBarItem(title: "Artworks",
                                                 image: UIImage(systemName: "paintpalette"),
                                                 tag: 0)
        navigationController.pushViewController(viewController, animated: false)
    }
}
