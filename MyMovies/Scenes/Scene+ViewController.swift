//
//  Scene+ViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
import ContactsUI
import AVFoundation
import AVKit

/// This Scene extension creates the desired View Controller and binds it to its View Model
extension Scene {
    func viewController() -> UIViewController {
        switch self {
        
        /// Onboarding Flow
        case .splash(let viewModel):
            var viewController = SplashViewController()
            viewController.bind(to: viewModel)
            return viewController
            
        case .tabBar(let viewModel):
            var viewController = TabBarViewController()
            viewController.bind(to: viewModel)
            return NavigationViewController(rootViewController: viewController)
        }
    }
}
