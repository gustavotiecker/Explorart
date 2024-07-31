//
//  HomeAPI.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

enum HomeAPI {
    case artworkOfTheDay
}

extension HomeAPI: EXPTargetAPI {
    var httpMethod: HttpMethod {
        switch self {
        case .artworkOfTheDay:
            return .get
        }
    }
    
    var endpoint: String {
        switch self {
        case .artworkOfTheDay:
            /// Simulando uma obra de arte "randômica" do dia
            return "/artworks?limit=1"
        }
    }
}
