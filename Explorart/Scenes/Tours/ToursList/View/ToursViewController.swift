//
//  ToursViewController.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

import UIKit

import UIKit

class ToursListViewController: UIViewController {
    
    private let viewModel: ToursListBusinessLogic
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .background
        tableView.register(TourCell.self, forCellReuseIdentifier: TourCell.reuseID)
        return tableView
    }()
    
    private lazy var spinner = UIActivityIndicatorView(style: .large)
    
    // MARK: - Initializers
    init(viewModel: ToursListBusinessLogic) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCode()
        viewModel.fetchTours()
    }
}

extension ToursListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.getToursListSectionFor(indexPath.section) {
        case .tours(let toursModel):
            if let cell = tableView.dequeueReusableCell(withIdentifier: TourCell.reuseID,
                                                        for: indexPath) as? TourCell {
                cell.setup(with: toursModel.data[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.getToursListSectionFor(indexPath.section) {
        case .tours(let toursModel):
            viewModel.goToTourDetail(of: toursModel.data[indexPath.row])
        }
    }
}

extension ToursListViewController: ToursListViewModelViewDelegate {
    func onViewStageChanged(_ viewModel: ToursListBusinessLogic, state: ToursListState) {
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

extension ToursListViewController: ViewCode {
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

