//
//  TourDetailViewController.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import SwiftUI

final class TourDetailViewController: UIHostingController<TourDetailView> {
    
    // MARK: - Initializers
    init(viewModel: TourDetailViewModel) {
        super.init(rootView: TourDetailView(viewModel: viewModel))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { return nil }
}
