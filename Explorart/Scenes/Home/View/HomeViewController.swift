//
//  HomeViewController.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension HomeViewController: ViewCode {
    func setupComponents() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupExtraConfiguration() {
        view.backgroundColor = .background
    }
}
