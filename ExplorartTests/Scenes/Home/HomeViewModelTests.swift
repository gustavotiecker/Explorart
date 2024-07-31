//
//  HomeViewModelTests.swift
//  ExplorartTests
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import XCTest
@testable import Explorart

final class HomeServiceTests: XCTestCase {
    
    private var homeServiceSpy: HomeServiceSpy!
    private var coordinatorDelegateMock: HomeViewModelCoordinatorDelegateMock!
    
    private lazy var sut: HomeViewModel! = makeSUT()
    
    private let expectationTimeout: TimeInterval = 3.0
    
    override func setUp() {
        super.setUp()
        homeServiceSpy = HomeServiceSpy()
        coordinatorDelegateMock = HomeViewModelCoordinatorDelegateMock()
    }
    
    override func tearDown() {
        super.tearDown()
        homeServiceSpy = nil
        coordinatorDelegateMock = nil
        sut = nil
    }
    
    private func makeSUT() -> HomeViewModel{
        let viewModel = HomeViewModel(service: homeServiceSpy)
        viewModel.coordinatorDelegate = coordinatorDelegateMock
        return viewModel
    }
    
    func testFetchArtworkOfTheDayCallsMethod() {
        // When
        sut.fetchArtworkOfTheDay()
        
        // Then
        XCTAssertTrue(homeServiceSpy.fetchArtworkOfTheDayCalled, "The fetchArtworkOfTheDay() method was not called")
    }
    
    func testFetchArtworkOfTheDayReturnsSuccess() {
        // Given
        let spy = HomeServiceSpy()
        let expectedArtwork = ArtworksModel.Artwork.fixture(id: 1, title: "Some Art Title")
        spy.resultToReturn = .success(expectedArtwork)
        var receivedResult: Result<ArtworksModel.Artwork, APIError>?
        
        // When
        spy.fetchArtworkOfTheDay { result in
            receivedResult = result
        }
        
        // Then
        switch receivedResult {
        case .success(let artwork):
            XCTAssertEqual(artwork.id, expectedArtwork.id)
            XCTAssertEqual(artwork.title, expectedArtwork.title)
        case .failure, .none:
            XCTFail("Expected success but got \(String(describing: receivedResult))")
        }
    }
    
    func testFetchArtworkOfTheDayReturnsFailure() {
        // Given
        let spy = HomeServiceSpy()
        let expectedError = APIError.unableToComplete
        spy.resultToReturn = .failure(expectedError)
        var receivedResult: Result<ArtworksModel.Artwork, APIError>?
        
        // When
        spy.fetchArtworkOfTheDay { result in
            receivedResult = result
        }
        
        // Then
        switch receivedResult {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, expectedError)
        case .none:
            XCTFail("Expected failure but got none")
        }
    }
    
    func testGetHomeSectionForShouldReturnCorrectDataAtLoadedState() {
        // Given
        let spy = HomeServiceSpy()
        let expectedArtwork = ArtworksModel.Artwork.fixture(id: 1, title: "Some Art Title")
        spy.resultToReturn = .success(expectedArtwork)
        sut = HomeViewModel(service: spy)
        
        // When
        sut.fetchArtworkOfTheDay()
        
        // Then
        if self.sut.state == .loaded {
            if case let .artworkOfTheDay(artwork) = self.sut.getHomeSectionFor(0) {
                XCTAssertEqual(artwork.id, expectedArtwork.id)
                XCTAssertEqual(artwork.title, expectedArtwork.title)
            } else {
                return XCTFail("Section should be .artworkOfTheDay")
            }
        } else {
            return XCTFail("State should be .loaded")
        }
    }
    
    func testGetNumberOfSectionShouldReturnCorrectValueAtLoadedState() {
        // Given
        let spy = HomeServiceSpy()
        spy.resultToReturn = .success(ArtworksModel.Artwork.fixture())
        sut = HomeViewModel(service: spy)
        
        // When
        sut.fetchArtworkOfTheDay()
        
        // Then
        if self.sut.state == .loaded {
            XCTAssertEqual(self.sut.getNumberOfSections(), 1)
        }  else {
            return XCTFail("State should be .loaded")
        }
    }
    
    func testGetNumberOfRowsInSectionShouldReturnCorrectValueAtLoadedState() {
        // Given
        let spy = HomeServiceSpy()
        spy.resultToReturn = .success(ArtworksModel.Artwork.fixture())
        sut = HomeViewModel(service: spy)
        
        // When
        sut.fetchArtworkOfTheDay()
        
        // Then
        if self.sut.state == .loaded {
            XCTAssertEqual(self.sut.getNumberOfRows(in: 0), 1)
        }  else {
            return XCTFail("State should be .loaded")
        }
    }
    
    func testGoToMoreInfoShouldCallCorrectCoordinatorMethodWithCorrectData() {
        sut.goToMoreInfo()
        XCTAssertEqual(coordinatorDelegateMock.presentSafariViewControllerParam,
                       URL(string: "https://www.artic.edu"))
    }
    
    func testPresentAlertShouldCallCorrectCoordinatorMethod() {
        sut.presentAlert(for: .unableToComplete)
        XCTAssertEqual(coordinatorDelegateMock.presentAlertMessageParam,
                       APIError.unableToComplete.rawValue)
    }
}
