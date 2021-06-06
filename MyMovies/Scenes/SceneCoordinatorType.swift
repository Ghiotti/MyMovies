//
//  SceneCoordinatorType.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

protocol SceneCoordinatorType {
    func transition(to scenes: [Scene], animated: Bool)
    func transition(to scene: Scene, type: SceneTransitionType, completion: (() -> Void)?)
    func pop(animated: Bool, completion: (() -> Void)?, type: PopType)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func simplePop(animated: Bool)
    func updateCurrentViewController(navigationController: UINavigationController)
    func updateCurrentViewController(viewController: UIViewController)
    func showAlert(alert: UIAlertController, animated: Bool, completion: (() -> Void)?)
    func buildNestedCoordinator(for viewController: UIViewController) -> SceneCoordinatorType
    func showAlertView(title: String?, message: String?, action: (() -> Void)?, completion: (() -> Void)?, showCancelButton: Bool?)
}

// MARK: - Pop
extension SceneCoordinatorType {
    
    func pop(completion: (() -> Void)?) {
        pop(animated: true, completion: completion, type: .simple)
    }
    
    func popToIndex(_ index: Int, completion: (() -> Void)?) {
        pop(animated: true, completion: completion, type: .index(index: index))
    }
    
    func popToRoot(completion: (() -> Void)?) {
        pop(animated: true, completion: completion, type: .root)
    }
}
