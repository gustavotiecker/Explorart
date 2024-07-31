//
//  TourCell.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import UIKit

class TourCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseID = "TourCell"
    
    // MARK: - UI Elements
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = .dsSpacing(.small)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let tourImageView = EXPImageView(frame: .zero)
    private let titleLabel = EXPLabel(style: .title, 
                                      textAlignment: .left,
                                      fontSize: .dsTypography(.secondaryTitleMedium))
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: - Public methods
    func setup(with tour: ToursModel.Tour) {
        if let url = URL(string: "https" + tour.image.dropFirst(4)) {
            tourImageView.downloadImage(from: url)
        }
        
        titleLabel.text = tour.title
    }
}

extension TourCell: ViewCode {
    func setupComponents() {
        stackView.addArrangedSubviews(tourImageView, titleLabel)
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .dsSpacing(.small)),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .dsSpacing(.small)),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.dsSpacing(.small)),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.dsSpacing(.small)),
            
            tourImageView.widthAnchor.constraint(equalToConstant: 48),
            tourImageView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setupExtraConfiguration() {
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
}
