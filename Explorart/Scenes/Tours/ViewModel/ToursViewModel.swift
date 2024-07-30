//
//  ToursViewModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

import UIKit

protocol ToursViewModelCoordinatorDelegate: AnyObject { }

protocol ToursViewModelViewDelegate: AnyObject {
    func onViewStageChanged(_ viewModel: ToursBusinessLogic, state: ToursState)
}

protocol ToursBusinessLogic {
    // MARK: - Requests
    func fetchTours()
    
    // MARK: - TableView configuration
    func getToursSectionFor(_ section: Int) -> ToursSection
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
}

final class ToursViewModel {
    
    // MARK: - Properties
    weak var coordinatorDelegate: ToursViewModelCoordinatorDelegate?
    weak var viewDelegate: ToursViewModelViewDelegate?
    private var service: ToursServiceType
    
    private var sections: [ToursSection] = []
    
    // MARK: - Initializers
    init(service: ToursServiceType = ToursService()) {
        self.service = service
    }
}

extension ToursViewModel: ToursBusinessLogic {
    // MARK: - Requests
    func fetchTours() {
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
    func getToursSectionFor(_ section: Int) -> ToursSection {
        return sections[section]
    }
    
    func getNumberOfSections() -> Int {
        return sections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return getToursSectionFor(section).count
    }
}
