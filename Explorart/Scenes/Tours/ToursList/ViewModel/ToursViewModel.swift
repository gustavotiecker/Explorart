//
//  ToursViewModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

import UIKit

protocol ToursListViewModelCoordinatorDelegate: AnyObject {
    func goToTourDetail(_ viewModel: ToursListBusinessLogic, tour: ToursModel.Tour)
    func presentAlert(_ viewModel: ToursListBusinessLogic,
                      title: String,
                      message: String,
                      buttonTitle: String,
                      buttonAction: (() -> Void)?)
}

protocol ToursListViewModelViewDelegate: AnyObject {
    func onViewStageChanged(_ viewModel: ToursListBusinessLogic, state: ToursListState)
}

protocol ToursListBusinessLogic {
    // MARK: - Requests
    func fetchTours()
    
    // MARK: - TableView configuration
    func getToursListSectionFor(_ section: Int) -> ToursListSection
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    
    // MARK: - Navigation
    func goToTourDetail(of tour: ToursModel.Tour)
    func presentAlert(for error: APIError)
}

final class ToursListViewModel {
    
    // MARK: - Properties
    weak var coordinatorDelegate: ToursListViewModelCoordinatorDelegate?
    weak var viewDelegate: ToursListViewModelViewDelegate?
    private var service: ToursServiceType
    
    private var sections: [ToursListSection] = []
    
    // MARK: - Initializers
    init(service: ToursServiceType = ToursService()) {
        self.service = service
    }
}

extension ToursListViewModel: ToursListBusinessLogic {
    // MARK: - Requests
    func fetchTours() {
        viewDelegate?.onViewStageChanged(self, state: .loading)
        service.fetchTours { result in
            switch result {
            case .success(let toursModel):
                self.sections.append(.tours(toursModel))
                self.viewDelegate?.onViewStageChanged(self, state: .loaded)
            case .failure(let error):
                self.viewDelegate?.onViewStageChanged(self, state: .error(error))
            }
        }
    }
    
    // MARK: - TableView configuration
    func getToursListSectionFor(_ section: Int) -> ToursListSection {
        return sections[section]
    }
    
    func getNumberOfSections() -> Int {
        return sections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return getToursListSectionFor(section).count
    }
    
    // MARK: - Navigation
    func goToTourDetail(of tour: ToursModel.Tour) {
        coordinatorDelegate?.goToTourDetail(self, tour: tour)
    }

    func presentAlert(for error: APIError) {
        coordinatorDelegate?.presentAlert(self,
                                          title: "Error",
                                          message: error.rawValue,
                                          buttonTitle: "Try again",
                                          buttonAction: fetchTours)
    }
}
