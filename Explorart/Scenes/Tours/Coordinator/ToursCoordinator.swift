//
//  ToursCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit
import SafariServices

final class ToursCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ToursListViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = ToursListViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        viewController.title = "Tours"
        viewController.tabBarItem = UITabBarItem(title: "Tours",
                                                 image: UIImage(systemName: "map"),
                                                 tag: 0)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension ToursCoordinator: ToursListViewModelCoordinatorDelegate {
    func goToTourDetail(_ viewModel: ToursListBusinessLogic, tour: ToursModel.Tour) {
        let viewModel = TourDetailViewModel(tour: tour)
        viewModel.coordinatorDelegate = self
        let viewController = TourDetailViewController(viewModel: viewModel)
        viewController.title = "Tour details"
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension ToursCoordinator: TourDetailViewModelCoordinatorDelegate {
    func presentSafariViewController(_ viewModel: TourDetailViewModel, with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .highlight
        navigationController.present(safariViewController, animated: true)
    }
}
