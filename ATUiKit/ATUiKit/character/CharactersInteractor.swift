//
//  ProductInteractor.swift
//  ATUiKit
//
//  Created by Engin Gülek on 5.05.2025.
//


class CharactersInteractor : PresenterToInteractorCharacters {
    weak var presenter : InteractorToPresenterCharacters?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
   
    func fetchData() {
        let request = GetCharacterRequest()
        networkManager.execute(request) { result in
            switch result {
            case .success(let list):
                self.presenter?.sendData(list: list)
            case .failure:
                self.presenter?.sendError()
            }
        }
    }
}
