//
//  GetCharacterRequest.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//

import Foundation

struct GetCharacterRequest : NetworkRequest {
    typealias Response = HRCharacters
    
    var path: NetworkPath {NetworkPath.characters}
    
    var method: AlamofireMethod = AlamofireMethod.GET
    
    var headers: [String : String]?
    
    var queryItems: [URLQueryItem]?
    
    var body: Data?
}


// This is for detail
// Usige Example :  let detailRwquest = GetCharacterDetailRequest(queryItems: [URLQueryItem(name: "index", value: "0")])
/*struct GetCharacterDetailRequest:NetworkRequest {
    typealias Response = HRCharacter
    
    var path: NetworkPath {NetworkPath.characters}
    var method: AlamofireMethod = AlamofireMethod.GET
    var headers: [String : String]?
    
    var queryItems: [URLQueryItem]?
    
    var body: Data?
    
    
}*/
