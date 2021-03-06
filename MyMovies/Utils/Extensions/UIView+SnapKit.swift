//
//  UIView+SnapKit.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import SnapKit

// MARK: - UIView safeArea extension
extension UIView {
    
    var safeArea: ConstraintBasicAttributesDSL {
        
        #if swift(>=3.2)
            if #available(iOS 11.0, *) {
                return self.safeAreaLayoutGuide.snp
            }
            return self.snp
        #else
            return self.snp
        #endif
    }
}
