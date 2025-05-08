//
//  NetworkManager.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//
import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func execute<R: NetworkRequest>(_ request: R, completion: @escaping (Result<R.Response, AFError>) -> Void)
}

enum NetworkError : Error {
    case invalid
}


class NetworkManager : NetworkManagerProtocol {
    func execute<R: NetworkRequest>(_ request: R, completion: @escaping (Result<R.Response, AFError>) -> Void) {
        let baseUrl =  URL(string: "https://potterapi-fedeperin.vercel.app/en/")!
        do {
            let urlRequest = try request.asURLRequest(baseURL: baseUrl)
            AF.request(urlRequest)
                .validate()
                .responseDecodable(of: R.Response.self) { response in
                   
                    completion(response.result)
                }
        } catch {
            completion(.failure(AFError.createURLRequestFailed(error: error)))
        }
    }

}
