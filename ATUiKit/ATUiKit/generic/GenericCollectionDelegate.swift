//
//  GenericCollectionDelegate.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//

import Foundation
import UIKit

class GenericCollectionDelegate<
    
    Source:CollectionViewDelegateSourceProtcol> :
    NSObject,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    private var source:Source
    
    init(source: Source) {
        self.source = source
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        source.didSelectItem(at:indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return source.sizeForItem(at: indexPath)
    }
}
