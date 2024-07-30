//
//  EXPImageDownloaderManager.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import UIKit

final class EXPImageDownloaderManager {
    
    static let shared = EXPImageDownloaderManager()
    
    private init() {}

    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
            completion(image)
        }
        task.resume()
    }
}

