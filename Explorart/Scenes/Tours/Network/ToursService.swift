//
//  ToursService.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

import UIKit

protocol ToursServiceType {
    func fetchTours(completion: @escaping (Result<ToursModel, APIError>) -> Void)
}

final class ToursService: EXPService<ToursAPI>, ToursServiceType {
    func fetchTours(completion: @escaping (Result<ToursModel, APIError>) -> Void) {
        request(endPoint: ToursAPI.tours.endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let toursModel = try JSONDecoder().decode(ToursModel.self, from: data)
                    completion(.success(toursModel))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure(_):
                completion(.failure(.unableToComplete))
            }
        }
    }
}
