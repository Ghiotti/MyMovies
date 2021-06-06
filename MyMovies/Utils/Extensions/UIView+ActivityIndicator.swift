//
//  UIView+ActivityIndicator.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

extension UIView {

    func showSpinner() {
        let spinner = SpinnerView()
        spinner.startSpinner(view: self)
    }

    func hideSpinner() {
        let spinner = self.subviews.first { view in
            return view is SpinnerView
        }
        
        spinner?.removeFromSuperview()
    }
}
