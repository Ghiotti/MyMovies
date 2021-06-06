//
//  UIView+Shadow.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
 
extension UIView {
    
    func dropShadow(size: CGSize = CGSize(width: 0.1, height: 3.0)) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        layer.shadowOffset = size
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 1.0
    }
    
    func hideShadow() {
        layer.shadowOpacity = 0
    }
}
