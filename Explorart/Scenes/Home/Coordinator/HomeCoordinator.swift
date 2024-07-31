//
//  HomeCoordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit
import SafariServices

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = HomeViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.viewDelegate = viewController
        viewController.title = "Home"
        viewController.tabBarItem = UITabBarItem(title: "Home",
                                                 image: UIImage(systemName: "house"),
                                                 tag: 0)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func presentSafariViewController(_ viewModel: any HomeBusinessLogic, with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .highlight
        navigationController.present(safariViewController, animated: true)
    }
    
    func presentAlert(_ viewModel: HomeBusinessLogic, 
                      title: String,
                      message: String,
                      buttonTitle: String,
                      buttonAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertViewController = EXPAlertViewController(title: title, 
                                                             message: message,
                                                             buttonTitle: buttonTitle,
                                                             buttonAction: buttonAction)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.navigationController.present(alertViewController, animated: true)
        }
    }
}
