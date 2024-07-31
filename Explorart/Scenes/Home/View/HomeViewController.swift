//
//  HomeViewController.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel: HomeBusinessLogic
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.register(ArtworkOfTheDayCell.self, forCellReuseIdentifier: ArtworkOfTheDayCell.reuseID)
        return tableView
    }()
    
    private lazy var spinner = UIActivityIndicatorView(style: .large)
    
    // MARK: - Initializers
    init(viewModel: HomeBusinessLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        viewModel.fetchArtworks()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.isScrollEnabled = tableView.contentSize.height > tableView.frame.size.height
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.getHomeSectionFor(indexPath.section) {
        case .artworkOfTheDay(let artwork):
            if let cell = tableView.dequeueReusableCell(withIdentifier: ArtworkOfTheDayCell.reuseID,
                                                        for: indexPath) as? ArtworkOfTheDayCell {
                cell.delegate = self
                cell.setup(with: artwork)
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}

extension HomeViewController: HomeViewModelViewDelegate {
    func onViewStageChanged(_ viewModel: any HomeBusinessLogic, state: HomeState) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
            switch state {
            case .loading:
                self.spinner.startAnimating()
                self.tableView.backgroundView = self.spinner
            case .loaded:
                self.spinner.stopAnimating()
                self.spinner.removeFromSuperview()
            case .error(let error):
                self.viewModel.presentAlert(for: error)
            }
        }
    }
}

extension HomeViewController: ArtworkOfTheDayCellDelegate {
    func didTapMoreInfoButton() {
        viewModel.goToMoreInfo()
    }
}

extension HomeViewController: ViewCode {
    func setupComponents() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupExtraConfiguration() {
        view.backgroundColor = .background
    }
}
