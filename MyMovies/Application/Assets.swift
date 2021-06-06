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
    case warningIcon = "CommonWarningIcon"

    var name: String { rawValue }
    var image: UIImage { UIImage(named: rawValue)! }
}

// Onboarding Flow

enum SplashAssets: String, AssetsProvider {
    case background = "Splash"

    var name: String { rawValue }
    var image: UIImage { UIImage(named: rawValue)! }
}

// Home Flow

//enum HomeAssets: String, AssetsProvider {
//    case logo = "HomeLogo"
//    case tabBarHistorical = "HomeTabBarHistorical"
//    case tabBarConsultPlates = "HomeTabBarConsultPlates"
//    case tabBarNewIncident = "HomeTabBarNewIncident"
//    case tabBarMaps = "HomeTabBarMaps"
//    case tabBarNotifications = "HomeTabBarNotifications"
//    case profile = "HomeProfile"
//
//    var name: String { rawValue }
//    var image: UIImage { UIImage(named: rawValue)! }
//
//    static func getImage(forSection section: HomeSection) -> UIImage {
//        switch section {
//        case .historical:
//            return HomeAssets.tabBarHistorical.image
//        case .consultPlates:
//            return HomeAssets.tabBarConsultPlates.image
//        case .newIncident:
//            return HomeAssets.tabBarNewIncident.image
//        case .maps:
//            return HomeAssets.tabBarMaps.image
//        case .notifications:
//            return HomeAssets.tabBarNotifications.image
//        }
//    }
//}
