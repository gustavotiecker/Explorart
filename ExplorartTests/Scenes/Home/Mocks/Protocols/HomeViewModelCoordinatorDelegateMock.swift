//
//  HomeViewModelCoordinatorDelegateMock.swift
//  ExplorartTests
//
//  Created by Gustavo Tiecker on 30/07/24.
//

@testable import Explorart
import UIKit

final class HomeViewModelCoordinatorDelegateMock: HomeViewModelCoordinatorDelegate {
    var presentSafariViewControllerParam = URL(string: "")
    func presentSafariViewController(_ viewModel: HomeBusinessLogic,
                                     with url: URL) {
        presentSafariViewControllerParam = url
    }
    
    var presentAlertMessageParam = ""
    func presentAlert(_ viewModel: HomeBusinessLogic,
                      title: String,
                      message: String,
                      buttonTitle: String,
                      buttonAction: (() -> Void)?) {
        presentAlertMessageParam = message
    }
}
