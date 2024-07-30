//
//  HomeViewModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func presentSafariViewController(_ viewModel: HomeBusinessLogic, with url: URL)
}

protocol HomeViewModelViewDelegate: AnyObject {
    func onViewStageChanged(_ viewModel: HomeBusinessLogic, state: HomeState)
}

protocol HomeBusinessLogic {
    // MARK: - Requests
    func fetchArtworks()
    
    // MARK: - TableView configuration
    func getHomeSectionFor(_ section: Int) -> HomeSection
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    
    // MARK: - Navigation
    func goToMoreInfo()
}

final class HomeViewModel {
    
    // MARK: - Properties
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    weak var viewDelegate: HomeViewModelViewDelegate?
    private var service: HomeServiceType
    
    private var sections: [HomeSection] = []
    
    // MARK: - Initializers
    init(service: HomeServiceType = HomeService()) {
        self.service = service
    }
}

extension HomeViewModel: HomeBusinessLogic {
    // MARK: - Requests
    func fetchArtworks() {
        service.fetchArtworkOfTheDay { result in
            switch result {
            case .success(let artwork):
                self.sections.append(.artworkOfTheDay(artwork))
                self.viewDelegate?.onViewStageChanged(self, state: .loaded)
            case .failure(let error):
                self.viewDelegate?.onViewStageChanged(self, state: .error(error))
            }
        }
    }
    
    // MARK: - TableView configuration
    func getHomeSectionFor(_ section: Int) -> HomeSection {
        return sections[section]
    }
    
    func getNumberOfSections() -> Int {
        return sections.count
    }
    
    func getNumberOfRows(in section: Int) -> Int {
        return getHomeSectionFor(section).count
    }
    
    // MARK: - Navigation
    func goToMoreInfo() {
        guard let url = URL(string: "https://www.artic.edu") else { return }
        coordinatorDelegate?.presentSafariViewController(self, with: url)
    }
}
