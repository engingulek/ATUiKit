//
//  MyProductCell.swift
//  ATUiKit
//
//  Created by Engin Gülek on 5.05.2025.
//

import UIKit
import SnapKit

class CharacterCell : UICollectionViewCell,ConfigurableCell {
 
    typealias CellItem = HRCharacter
    
    private let nameLabel = UILabel()
    private let imageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let houseNmaeLabel = UILabel()
  

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderColor = UIColor(hex: "#000000")?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.size.equalTo(80)
        }
        
        addSubview(nameLabel)
           nameLabel.snp.makeConstraints { make in
               make.top.equalTo(imageView.snp.top)
               make.leading.equalTo(imageView.snp.trailing).offset(5)
               make.trailing.equalToSuperview().offset(-5)
           }
        
        addSubview(nicknameLabel)
        nicknameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
        }
        
        addSubview(houseNmaeLabel)
        houseNmaeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-5)
        }
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with cellItem: HRCharacter) {
        nameLabel.text = "Full Name: \(cellItem.fullName)"
        imageView.setImageWithKigfisher(with: cellItem.image)
        nicknameLabel.text = "Nick Name: \(cellItem.nickname)"
        houseNmaeLabel.text = "Hogwarts House: \(cellItem.hogwartsHouse.rawValue)"
    }
}
