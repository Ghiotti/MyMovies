//
//  HomeViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

class HomeViewController: BaseViewController {
    
    var viewModel: HomeViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func updateCoordinator() {
        
    }
}

extension HomeViewController: Bindable {
    
    func bindViewModel() {
        
    }
}
