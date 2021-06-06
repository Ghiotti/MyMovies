//
//  Scene.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import ContactsUI
import MediaPlayer

/// A Scene is composed of a View Controller and a View Model.
/// These two components show always go hand-in-hand.
enum Scene {
    
    /// Onboarding Flow
    case splash(SplashViewModel)
    
    /// Main Flow
    case tabBar(TabBarViewModel)
}
