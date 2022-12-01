//
//  EndpointItem.swift
//  MovieDBApp
//
//  Created by Janki on 11/11/22.
//

import Foundation
import Alamofire

protocol EndPointType {
    // MARK: - Vars & Lets
    var baseURL: String { get }
    var httpMethod: HTTPMethod { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
}

enum EndpointItem {
    // MARK: User actions
    case getMovieList(String, String)
}

// MARK: - EndPointType
extension EndpointItem: EndPointType {
    var headers: Alamofire.HTTPHeaders {
        return ["Content-Type": "application/json"]
    }
    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getMovieList(_, _) :
            return .get
        }
    }
    var url: URL {
        return URL(string: self.baseURL + self.path)!
    }
    
    var encoding: Alamofire.ParameterEncoding {
        return JSONEncoding.default
    }

    var baseURL: String {
        return StringConstants.baseURL
    }
    var path: String {
        switch self {
        case .getMovieList(let apiKey, let nextPage):
            return "/movie/popular?api_key=\(apiKey)&language=en-US&page=\(nextPage)"
        }
    }
}
