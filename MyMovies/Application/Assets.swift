//
//  Assets.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

protocol AssetsProvider {
    var name: String { get }
    var image: UIImage { get }
}

// Common

enum CommonAssets: String, AssetsProvider {
    case search = "CommonSearchIcon"

    var name: String { rawValue }
    var image: UIImage { UIImage(named: rawValue)! }
}

// Onboarding Flow

enum SplashAssets: String, AssetsProvider {
    case background = "Splash"

    var name: String { rawValue }
    var image: UIImage { UIImage(named: rawValue)! }
}

// Main Flow

enum TabBarAssets: String, AssetsProvider {
    case favorite = "TabBarFavorite"
    case movie = "TabBarMovie"

    var name: String { rawValue }
    var image: UIImage { UIImage(named: rawValue)! }
}
