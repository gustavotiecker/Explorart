//
//  EXPImageView.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 28/07/24.
//

import UIKit

class EXPImageView: UIImageView {
    
    // MARK: - Properties
    let placeholderImage = UIImage(systemName: "theatermask.and.paintbrush.fill")
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
    
    // MARK: - Private Methods
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func placeNewImage(_ image: UIImage?) {
        if let image = image {
            self.image = image
        } else {
            self.image = placeholderImage
        }
    }
}
