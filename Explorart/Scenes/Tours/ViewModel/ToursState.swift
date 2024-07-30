//
//  ToursState.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 29/07/24.
//

enum ToursState: Equatable {
    case loading
    case loaded
    case error(APIError)
    
    static func == (lhs: ToursState, rhs: ToursState) -> Bool {
        switch(lhs, rhs) {
        case (.loading, .loading): return true
        case (.loaded, .loaded): return true
        case (.error, .error): return true
        default: return false
        }
    }
}

enum ToursSection: Equatable {
    
    case tours(ToursModel)
    
    var count: Int {
        switch self {
        case .tours(let toursModel):
            return toursModel.data.count
        }
    }
    
    static func == (lhs: ToursSection, rhs: ToursSection) -> Bool {
        switch(lhs, rhs) {
        case (.tours, .tours): return true
        }
    }
}
