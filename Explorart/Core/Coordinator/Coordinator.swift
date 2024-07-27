//
//  Coordinator.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
