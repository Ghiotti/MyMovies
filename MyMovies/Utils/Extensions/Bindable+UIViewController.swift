//
//  Bindable+UIViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

/// Every View Controller that conforms to Bindable needs to have a View Model
/// and implement the 'bindViewModel()' function.
protocol Bindable {
    
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

// MARK: - Bindable bind extension

extension Bindable where Self: UIViewController {
    
    mutating func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
