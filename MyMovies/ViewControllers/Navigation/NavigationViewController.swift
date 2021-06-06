//
//  NavigationViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

final class NavigationViewController: UINavigationController {
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStyle()
    }
    
    // MARK: Private Methods
    
    private func addStyle() {
        setNavigationBarHidden(true, animated: false)

        //navigationBar.backIndicatorImage = CommonAssets.backIcon.image
        //navigationBar.backIndicatorTransitionMaskImage = CommonAssets.backIcon.image
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .primary
        navigationBar.isTranslucent = false

        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
    }
}
