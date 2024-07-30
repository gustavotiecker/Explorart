//
//  ToursCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

final class ToursCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ToursViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = ToursViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        viewController.title = "Tours"
        viewController.tabBarItem = UITabBarItem(title: "Tours",
                                                 image: UIImage(systemName: "map"),
                                                 tag: 0)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension ToursCoordinator: ToursViewModelCoordinatorDelegate {}
