//
//  HomeViewModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func presentSafariViewController(_ viewModel: HomeBusinessLogic, with url: URL)
    func presentAlert(_ viewModel: HomeBusinessLogic,
                      title: String,
                      message: String,
                      buttonTitle: String,
                      buttonAction: (() -> Void)?)
}

protocol HomeViewModelViewDelegate: AnyObject {
    func onViewStageChanged(_ viewModel: HomeBusinessLogic, state: HomeState)
}

protocol HomeBusinessLogic {
    // MARK: - Requests
    func fetchArtworkOfTheDay()
    
    // MARK: - TableView configuration
    func getHomeSectionFor(_ section: Int) -> HomeSection
    func getNumberOfSections() -> Int
    func getNumberOfRows(in section: Int) -> Int
    
    // MARK: - Navigation
    func goToMoreInfo()
    func presentAlert(for error: APIError)
}

final class HomeViewModel {
    
    // MARK: - Properties
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    weak var viewDelegate: HomeViewModelViewDelegate?
    private var service: HomeServiceType
    
    private var sections: [HomeSection] = []
    
    private(set) var state: HomeState = .loading {
        didSet { viewDelegate?.onViewStageChanged(self, state: state) }
    }
    
    // MARK: - Initializers
    init(service: HomeServiceType = HomeService()) {
        self.service = service
    }
}

extension HomeViewModel: HomeBusinessLogic {
    // MARK: - Requests
    func fetchArtworkOfTheDay() {
        state = .loading
        service.fetchArtworkOfTheDay { result in
            switch result {
            case .success(let artwork):
                self.sections.append(.artworkOfTheDay(artwork))
                self.state = .loaded
            case .failure(let error):
                self.state = .error(error)
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
    
    func presentAlert(for error: APIError) {
        coordinatorDelegate?.presentAlert(self,
                                          title: "Error",
                                          message: error.rawValue,
                                          buttonTitle: "Try again", 
                                          buttonAction: fetchArtworkOfTheDay)
    }
}
