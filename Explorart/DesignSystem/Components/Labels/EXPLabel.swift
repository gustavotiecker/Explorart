//
//  EXPLabel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 28/07/24.
//

import UIKit

enum EXPLabelStyle {
    case title
    case secondaryTitle
    case body
}

class EXPLabel: UILabel {
    
    init(style: EXPLabelStyle, textAlignment: NSTextAlignment = .natural, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configureStyle(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle(style: EXPLabelStyle) {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        
        switch style {
        case .title:
            textColor = .label
            minimumScaleFactor = 0.9
            lineBreakMode = .byTruncatingTail
        case .secondaryTitle:
            textColor = .secondaryLabel
            minimumScaleFactor = 0.9
            numberOfLines = 0
        case .body:
            textColor = .secondaryLabel
            font = UIFont.preferredFont(forTextStyle: .body)
            adjustsFontForContentSizeCategory = true
            minimumScaleFactor = 0.75
            lineBreakMode = .byWordWrapping
        }
    }
}
