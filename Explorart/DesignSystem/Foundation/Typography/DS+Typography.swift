//
//  DS+Typography.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import UIKit

extension DS {
    struct Tipography {
        let fontSize: CGFloat
    }
}

extension DS.Tipography {
    static let titleLarge: Self = .init(fontSize: 22)
    static let titleMedium: Self = .init(fontSize: 18)
    static let secondaryTitleLarge: Self = .init(fontSize: 16)
    static let secondaryTitleMedium: Self = .init(fontSize: 14)
}

extension CGFloat {
    static func dsTypography(_ typography: DS.Tipography) -> Self { typography.fontSize }
}
