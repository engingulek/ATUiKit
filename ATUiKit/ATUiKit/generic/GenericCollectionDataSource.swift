//
//  ConfigureCell.swift
//  ATUiKit
//
//  Created by Engin Gülek on 4.05.2025.
//

import UIKit
import SnapKit


protocol ConfigurableCell {
    associatedtype CellItem
    func configure(with cellItem:CellItem)
}



class GenericCollectionDataSource<Cell: UICollectionViewCell, Source: CollectionViewDataSourceProtcol>:
    NSObject, UICollectionViewDataSource where Cell: ConfigurableCell, Cell.CellItem == Source.CellItem{
    private var source : Source
    
    init(source: Source) {
        self.source = source
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return source.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  source.numberOfRowsInSection(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { fatalError("Could not dequeue cell") }
        
       let item =  source.cellForItem(at: indexPath)
        cell.configure(with: item)
        return cell
    }
}
