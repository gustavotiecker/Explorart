//
//  HomeServiceSpy.swift
//  ExplorartTests
//
//  Created by Gustavo Tiecker on 30/07/24.
//

@testable import Explorart

final class HomeServiceSpy: HomeServiceType {
    private(set) var fetchArtworkOfTheDayCalled = false
    
    var completion: ((Result<ArtworksModel.Artwork, APIError>) -> Void)?
    
    var resultToReturn: Result<ArtworksModel.Artwork, APIError>?

    func fetchArtworkOfTheDay(completion: @escaping (Result<ArtworksModel.Artwork, APIError>) -> Void) {
        fetchArtworkOfTheDayCalled = true
        self.completion = completion
        
        if let result = resultToReturn {
            completion(result)
        }
    }
    
    func complete(with result: Result<ArtworksModel.Artwork, APIError>) {
        completion?(result)
    }
}

