//
//  SpinnerView.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class SpinnerView: UIView {
    
    func startSpinner(view: UIView) {
        backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let spinner = UIActivityIndicatorView.init(style: .large)
        
        view.addSubview(self)
        self.addSubview(spinner)
        
        snp.self.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }

        spinner.startAnimating()
    }
}
