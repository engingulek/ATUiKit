//
//  UICollectionView+Extension.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//
import UIKit
extension UICollectionView {
     static func primaryCollectionView(tag:Int = 0,scroolDirection:UICollectionView.ScrollDirection) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.scrollDirection = scroolDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.tag = tag
         
        return collectionView
    }
}
