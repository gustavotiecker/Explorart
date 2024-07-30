//
//  ToursModel.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

// MARK: - Tours
struct ToursModel: Codable {
    let pagination: Pagination
    let data: [Tour]
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

    // MARK: - Tour
    struct Tour: Codable {
        let id: Int
        let apiModel: String
        let apiLink: String
        let title: String
        let image: String
        let description: String

        enum CodingKeys: String, CodingKey {
            case id
            case apiModel = "api_model"
            case apiLink = "api_link"
            case title, image, description
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