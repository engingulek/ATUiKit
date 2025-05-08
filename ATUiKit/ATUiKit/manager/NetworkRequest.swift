//
//  NetworkRequest.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//

import Alamofire
import Foundation

enum AlamofireMethod: String {
    case GET
}

enum NetworkPath {
    case characters
}

extension NetworkPath {
    var path : String {
        switch self {
        case .characters:
            "characters"
        }
    }
}

protocol NetworkRequest  {
    associatedtype Response : Decodable
    var path : NetworkPath {get}
    var method: AlamofireMethod  { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}

extension NetworkRequest {
    func asURLRequest(baseURL: URL) throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path.path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems

        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body

        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        return request
    }
}
