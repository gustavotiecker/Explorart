//
//  EXPTargetAPI.swift
//  Explorart
//
//  Created by Gustavo Tiecker on 27/07/24.
//

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol EXPTargetAPI {
    var httpMethod: HttpMethod { get }
    var endpoint: String { get }
}

enum APIError: String, Error {
    case invalidRequest = "Invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data receveid from the server was invalid. Please try again."
}
