//
//  HomeState.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 28/07/24.
//

enum HomeState: Equatable {
    case loading
    case loaded
    case error(APIError)
    
    static func == (lhs: HomeState, rhs: HomeState) -> Bool {
        switch(lhs, rhs) {
        case (.loading, .loading): return true
        case (.loaded, .loaded): return true
        case (.error, .error): return true
        default: return false
        }
    }
}

enum HomeSection: Equatable {
    
    case artworkOfTheDay(ArtworksModel.Artwork)
    
    var count: Int {
        switch self {
        case .artworkOfTheDay(let artwork):
            return 1
        }
    }
    
    static func == (lhs: HomeSection, rhs: HomeSection) -> Bool {
        switch(lhs, rhs) {
        case (.artworkOfTheDay, .artworkOfTheDay): return true
        }
    }
}
