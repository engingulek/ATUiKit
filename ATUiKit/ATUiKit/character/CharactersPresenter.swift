//
//  Presenter.swift
//  ATUiKit
//
//  Created by Engin Gülek on 5.05.2025.
//

import Foundation


final class CharactersPresenter  {
    weak var view : PresenterToViewCharacters?
    private var interactor : PresenterToInteractorCharacters
    
    private var characterList : HRCharacters = []
    init(view:PresenterToViewCharacters?,
         interactor : PresenterToInteractorCharacters,
         
    ) {
        self.view = view
        self.interactor = interactor
        
    }
}


extension CharactersPresenter : ViewToPresenterCharacters {
    
    
    typealias CellItem = HRCharacter
    func sizeForItem(at indexPath: IndexPath) -> CGSize{
        return CGSize(width: 350, height: 120)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let character = characterList[indexPath.row]
        print(character)
        
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        return characterList.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    
    func cellForItem(at indexPath: IndexPath) -> HRCharacter {
        let character = characterList[indexPath.row]
        return character
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: "#FFFFFF")
        view?.changeTitle(title: "Characters")
        view?.collectionPrepareView()
        interactor.fetchData()
        
    }
}


extension CharactersPresenter :  InteractorToPresenterCharacters {
    func sendData(list: HRCharacters) {
        characterList = list
        view?.reloadCollectionView()
    }
    
    func sendError() {
        view?.sendErrorMessage()
    }
}
