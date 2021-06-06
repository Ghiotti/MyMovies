//
//  SceneTransitionType.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import UIKit

enum RootTransitionType {
    case none
    case crossFade
}

enum ModalTransitionType {
    case fullScreen
    case overCurrentContext
}

enum SceneTransitionType {
    /// you can extend this to add animated transition types,
    /// interactive transitions and even child view controllers!
    
    /// make view controller the root view controller
    case root(RootTransitionType)
    /// push view controller to navigation stack
    case push
    /// present view controller modally
    case modal(UIModalPresentationStyle = .fullScreen, UIModalTransitionStyle = .coverVertical)
}

enum PopType {
    case simple
    case index(index: Int)
    case root
}
