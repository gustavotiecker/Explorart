//
//  ArtworksModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 28/07/24.
//

struct ArtworksModel: Codable {
    let pagination: Pagination
    let data: [Artwork]
    let info: Info
    let config: Config
    
    // MARK: - Pagination
    struct Pagination: Codable {
        let total: Int
        let limit: Int
        let offset: Int
        let totalPages: Int
        let currentPage: Int
        let nextURL: String

        enum CodingKeys: String, CodingKey {
            case total, limit, offset
            case totalPages = "total_pages"
            case currentPage = "current_page"
            case nextURL = "next_url"
        }
    }

    // MARK: - Artwork
    struct Artwork: Codable {
        let id: Int
        let title: String
        let artistDisplay: String?
        let placeOfOrigin: String?

        enum CodingKeys: String, CodingKey {
            case id
            case title
            case artistDisplay = "artist_display"
            case placeOfOrigin = "place_of_origin"
        }
    }

    // MARK: - Info
    struct Info: Codable {
        let licenseText: String
        let licenseLinks: [String]
        let version: String

        enum CodingKeys: String, CodingKey {
            case licenseText = "license_text"
            case licenseLinks = "license_links"
            case version
        }
    }

    // MARK: - Config
    struct Config: Codable {
        let iiifURL: String
        let websiteURL: String

        enum CodingKeys: String, CodingKey {
            case iiifURL = "iiif_url"
            case websiteURL = "website_url"
        }
    }

}
