//
//  TourDetailViewModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import SwiftUI

protocol TourDetailViewModelCoordinatorDelegate: AnyObject {
    func presentSafariViewController(_ viewModel: TourDetailViewModel, with url: URL)
}

final class TourDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    weak var coordinatorDelegate: TourDetailViewModelCoordinatorDelegate?
    let tour: ToursModel.Tour
    
    
    // MARK: - Initializers
    init(tour: ToursModel.Tour) {
        self.tour = tour
    }
    
    // MARK: - Navigation
    func goToTourBooking() {
        guard let url = URL(string: "https://www.artic.edu") else { return }
        coordinatorDelegate?.presentSafariViewController(self, with: url)
    }
}
