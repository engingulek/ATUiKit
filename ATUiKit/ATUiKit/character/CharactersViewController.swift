//
//  ViewController.swift
//  ATUiKit
//
//  Created by Engin Gülek on 4.05.2025.
//

import UIKit

class CharactersViewController: UIViewController{
    
    
    var presenter : ( any ViewToPresenterCharacters )!
    
    private lazy var collectionView = UICollectionView.primaryCollectionView(scroolDirection: .vertical)
    private var  dataSource : GenericCollectionDataSource<
        CharacterCell,CharactersPresenter
    >?
    
    private var delegatSource : GenericCollectionDelegate<CharactersPresenter>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: String(describing: CharacterCell.self))
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        presenter.viewDidLoad()
        
    }
}

extension CharactersViewController : PresenterToViewCharacters {
    
    func collectionPrepareView() {
        guard let presenter = presenter as? CharactersPresenter else { return }
        
        let characterCVDataSource = GenericCollectionDataSource<
            CharacterCell,CharactersPresenter
        >(source: presenter )
        self.dataSource = characterCVDataSource
        
        collectionView.dataSource = dataSource
        
        let charecterCVDelegateSource = GenericCollectionDelegate<CharactersPresenter>(source: presenter )
        self.delegatSource = charecterCVDelegateSource
        
        collectionView.delegate = delegatSource
        
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            collectionView.reloadData()
        }
        
    }
    
    
    func sendErrorMessage() {
        
    }
}
