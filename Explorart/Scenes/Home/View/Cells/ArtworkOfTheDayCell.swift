//
//  ArtworkOfTheDayView.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

import UIKit

protocol ArtworkOfTheDayCellDelegate: AnyObject {
    func didTapMoreInfoButton()
}

class ArtworkOfTheDayCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseID = "ArtworkOfTheDayCell"
    weak var delegate: ArtworkOfTheDayCellDelegate?
    
    // MARK: - UI Elements
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .background
        view.layer.cornerRadius = 18
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 8.0
        view.layer.shadowOpacity = 0.7
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel = EXPLabel(style: .title, textAlignment: .left, fontSize: 22)
    private let artworkImageView = EXPImageView(frame: .zero)
    private let artworkTitleLabel = EXPLabel(style: .title, textAlignment: .center, fontSize: 18)
    private let artistNameLabel = EXPLabel(style: .secondaryTitle, textAlignment: .center, fontSize: 16)
    private let placeOfOriginLabel = EXPLabel(style: .secondaryTitle, textAlignment: .center, fontSize: 14)

    private lazy var moreInfoButton: EXPButton = {
        let button = EXPButton(title: "More info")
        button.addTarget(self, action: #selector(moreInfoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.layer.shadowPath = UIBezierPath(roundedRect: cardView.bounds, cornerRadius: 18).cgPath
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: - Public methods
    func setup(with artwork: ArtworksModel.Artwork) {
        titleLabel.text = "Art of the day"
        titleLabel.textColor = .highlight
        artworkTitleLabel.text = artwork.title
        artistNameLabel.text = artwork.artistDisplay
        placeOfOriginLabel.text = artwork.placeOfOrigin
        
        /// Deveria ser uma imagem do modelo para ser baixada. Mas, a API não possui essa imagem em seu modelo de dados
        /// por isso, está sendo utilizada uma imagem de exemplo
        artworkImageView.placeNewImage(UIImage(named: "artwork-of-the-day-example-image"))
    }
    
    // MARK: - Actions
    @objc func moreInfoButtonTapped() {
        delegate?.didTapMoreInfoButton()
    }
}

extension ArtworkOfTheDayCell: ViewCode {
    func setupComponents() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(artworkImageView)
        stackView.addArrangedSubview(artworkTitleLabel)
        stackView.addArrangedSubview(artistNameLabel)
        stackView.addArrangedSubview(placeOfOriginLabel)
        stackView.addArrangedSubview(moreInfoButton)
        cardView.addSubview(stackView)
        contentView.addSubview(cardView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            
            moreInfoButton.heightAnchor.constraint(equalToConstant: 56),
            artworkImageView.widthAnchor.constraint(equalToConstant: 200),
            artworkImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func setupExtraConfiguration() {
        contentView.backgroundColor = .background
    }
}
