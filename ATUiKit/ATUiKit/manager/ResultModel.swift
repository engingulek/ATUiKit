//
//  ResultModel.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//


struct HRCharacter: Codable {
    let fullName, nickname: String
    let hogwartsHouse: HogwartsHouse
    let interpretedBy: String
    let children: [String]
    let image: String
    let birthdate: String
    let index: Int
}

enum HogwartsHouse: String, Codable {
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

typealias HRCharacters = [HRCharacter]
