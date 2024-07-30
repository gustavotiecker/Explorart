//
//  HomeService.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 28/07/24.
//

import UIKit

protocol HomeServiceType {
    func fetchArtworkOfTheDay(completion: @escaping (Result<Artwork, APIError>) -> Void)
}

final class HomeService: EXPService<HomeAPI>, HomeServiceType {
    func fetchArtworkOfTheDay(completion: @escaping (Result<Artwork, APIError>) -> Void) {
        request(endPoint: HomeAPI.artworkOfTheDay.endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let artworks = try JSONDecoder().decode(Artworks.self, from: data)
                    if let artwork = artworks.data.first {
                        completion(.success(artwork))
                    } else {
                        completion(.failure(.unableToComplete))
                    }
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(_):
                completion(.failure(.unableToComplete))
            }
        }
    }
}
