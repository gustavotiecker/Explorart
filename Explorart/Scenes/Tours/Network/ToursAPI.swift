//
//  ToursAPI.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

enum ToursAPI {
    case tours
}

extension ToursAPI: EXPTargetAPI {
    var httpMethod: HttpMethod {
        switch self {
        case .tours:
            return .get
        }
    }
    
    var endpoint: String {
        switch self {
        case .tours:
            return "/tours?limit=10"
        }
    }
}
