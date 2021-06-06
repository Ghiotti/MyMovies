//
//  UIImage+Kingfisher.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImage(fromUrlString urlString: String, placeHolder: UIImage) {
        let fullPath = APIEnvironment().pathForImage(urlString)
        guard let imageUrl = URL(string: fullPath) else {
            return
        }

        kf.setImage(with: imageUrl)        
    }
}
