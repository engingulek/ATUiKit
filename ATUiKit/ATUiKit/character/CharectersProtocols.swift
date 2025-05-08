//
//  ProductInteractor.swift
//  ATUiKit
//
//  Created by Engin Gülek on 5.05.2025.
//

import Foundation

typealias CharactersKit = UIViewAble & SegueAble & NavConUIAble

protocol CollectionViewDataSourceProtcol {
    associatedtype CellItem
    func numberOfRowsInSection(in section:Int) -> Int
    func cellForItem(at indexPath:IndexPath) -> CellItem
    func numberOfSections() -> Int
}


protocol CollectionViewDelegateSourceProtcol {
    func didSelectItem(at indexPath:IndexPath)
    func sizeForItem(at indexPath:IndexPath) -> CGSize
}

protocol ViewToPresenterCharacters : CollectionViewDataSourceProtcol,CollectionViewDelegateSourceProtcol{
    func viewDidLoad()
}


protocol PresenterToViewCharacters : AnyObject & CharactersKit {
    func collectionPrepareView()
    func reloadCollectionView()
    func sendErrorMessage()
}

protocol PresenterToInteractorCharacters : AnyObject {
    func fetchData()
}


protocol InteractorToPresenterCharacters:AnyObject {
    func sendData(list:HRCharacters)
    func sendError()
}

