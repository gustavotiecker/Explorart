//
//  DS+Spacing.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 30/07/24.
//

import UIKit

extension DS {
    struct Spacing {
        let value: CGFloat
    }
}

extension DS.Spacing {
    static let none: Self = .init(value: 0)
    static let micro: Self = .init(value: 2)
    static let tiny: Self = .init(value: 4)
    static let xxSmall: Self = .init(value: 8)
    static let xSmall: Self = .init(value: 12)
    static let small: Self = .init(value: 16)
    static let medium: Self = .init(value: 24)
    static let large: Self = .init(value: 32)
    static let xLarge: Self = .init(value: 48)
    static let xxLarge: Self = .init(value: 64)
}

extension CGFloat {
    static func dsSpacing(_ spacing: DS.Spacing) -> Self { spacing.value }
}
