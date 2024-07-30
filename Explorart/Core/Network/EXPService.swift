//
//  EXPService.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

class EXPService<T: EXPTargetAPI> {
    
    private let baseURL = "https://api.artic.edu/api/v1"
    
    func request(body: String = "", endPoint: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        
        guard let url = URL(string: baseURL + endPoint) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}
