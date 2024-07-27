//
//  ViewCodeProtocol.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

protocol ViewCode {
    func setupViewCode()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension ViewCode {
    func setupViewCode() {
        setupComponents()
        setupConstraints()
        setupExtraConfiguration()
    }

    func setupExtraConfiguration() {}
}
