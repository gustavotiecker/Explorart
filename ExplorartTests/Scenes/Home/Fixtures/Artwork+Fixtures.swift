//
//  Artwork+Fixtures.swift
//  ExplorartTests
//
//  Created by Gustavo Tiecker on 30/07/24.
//

@testable import Explorart

extension ArtworksModel.Artwork {
    
    static func fixture(
        id: Int = 0,
        title: String = "",
        artistDisplay: String = "",
        placeOfOrigin: String = ""
    ) -> ArtworksModel.Artwork {
        .init(id: id,
              title: title,
              artistDisplay: artistDisplay,
              placeOfOrigin: placeOfOrigin)
    }
}
