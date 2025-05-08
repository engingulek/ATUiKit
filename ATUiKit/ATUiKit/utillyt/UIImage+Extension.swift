//
//  Kingfisher+Extension.swift
//  ATUiKit
//
//  Created by Engin Gülek on 7.05.2025.
//

import Foundation
import UIKit.UIImageView
import Kingfisher

//MARK: UIImageView + Extension
extension UIImageView {
    // Display image with url using kingfisher
    /// - Parameters:
    ///   - urlString: image url
    ///   - size: image size
    func setImageWithKigfisher(with urlString: String?,size:Int = 100) {
        guard let url = URL(string: urlString ?? "") else {
            self.image = UIImage(systemName: "photo")
            return
        }
       let resizingProcessor = ResizingImageProcessor(
        referenceSize: CGSize(width: size, height: size), mode: .aspectFill)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "photo"),
            options: [
                .processor(resizingProcessor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage,
                .memoryCacheExpiration(.seconds(1)),
                .diskCacheExpiration(.days(7))
                
            ],
            progressBlock: nil,
            completionHandler: {  _ in
                
            }
        )
    }
}
