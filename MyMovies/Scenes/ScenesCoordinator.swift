//
//  ScenesCoordinator.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

/// Handle transition between scenes
final class SceneCoordinator: SceneCoordinatorType {

    fileprivate var window: UIWindow
    fileprivate var currentViewController: UIViewController?
    
    required init(window: UIWindow, viewController: UIViewController? = nil) {
        self.window = window
        currentViewController = viewController ?? window.rootViewController
    }
    
    func buildNestedCoordinator(for viewController: UIViewController) -> SceneCoordinatorType {
        return SceneCoordinator(window: self.window, viewController: viewController)
    }
    
    static func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let tabBarController = viewController as? UITabBarController {
            if let navigationController = tabBarController.viewControllers?.first as? NavigationViewController {
                return navigationController.viewControllers.first!
            }
        } else if let navigationController = viewController as? UINavigationController {
            if let firstController = navigationController.viewControllers.first {
                return firstController
            }

            return navigationController
        }

        return viewController
    }
    
    func transition(to scenes: [Scene], animated: Bool) {
        let viewControllers = scenes.map { $0.viewController() }
        let navigationController = UINavigationController()
        navigationController.setViewControllers(viewControllers, animated: animated)
        self.currentViewController = viewControllers.last
        
        let snapshot = window.snapshotView(afterScreenUpdates: true)!
        
        window.rootViewController = navigationController
        window.addSubview(snapshot)

        UIView.animate(withDuration: Constants.defaultAnimationDuration, animations: {() in
            snapshot.layer.opacity = 0
        }, completion: { _ in
            snapshot.removeFromSuperview()
        })
    }
    
    func transition(to scene: Scene, type: SceneTransitionType, completion: (() -> Void)? = nil) {
        let viewController = scene.viewController()
        switch type {
        case .root(let rootTransitionType):
            currentViewController?.navigationController?.viewControllers.removeAll()
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
            switch rootTransitionType {
            case .crossFade:
                let snapshot = window.snapshotView(afterScreenUpdates: true)!
                
                window.rootViewController = viewController
                window.addSubview(snapshot)

                UIView.animate(withDuration: Constants.defaultAnimationDuration, animations: {() in
                    snapshot.layer.opacity = 0
                }, completion: { _ in
                    snapshot.removeFromSuperview()
                })
            case .none:
                window.rootViewController = viewController
            }
            
            completion?()
            
        case .push:

            if let navigationController = currentViewController as? UINavigationController {
                navigationController.pushViewController(viewController, animated: true)
                currentViewController = SceneCoordinator.actualViewController(for: viewController)

                return
            }
            
            guard let navigationController = currentViewController?.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }

            navigationController.pushViewController(viewController, animated: true)
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
            
        case .modal(let modalPresentationStyle, let modalTransitionStyle):
            // since it's a modal, the current view controller remains the same
            viewController.modalPresentationStyle = modalPresentationStyle
            viewController.modalTransitionStyle = modalTransitionStyle
            currentViewController?.present(viewController, animated: true, completion: completion)
            currentViewController = SceneCoordinator.actualViewController(for: viewController)
        }
    }
    
    func pop(animated: Bool, completion: (() -> Void)?, type: PopType) {
        if let navigationController = currentViewController?.navigationController {
            // Hack to feature a completion block for the pop view controller method
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            switch type {
            case .index(let index):
                guard let viewControllerToGo = currentViewController?.navigationController?.viewControllers[index],
                      navigationController.popToViewController(viewControllerToGo, animated: true) != nil else {
                        fatalError("can't navigate back from \(String(describing: currentViewController))")
                }
            case .simple:
                guard navigationController.popViewController(animated: animated) != nil else {
                    fatalError("can't navigate back from \(String(describing: currentViewController))")
                }
            case .root:
                guard navigationController.popToRootViewController(animated: true) != nil else {
                    fatalError("can't navigate back from \(String(describing: currentViewController))")
                }
            }
            CATransaction.commit()
            currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
        } else {
            
            fatalError("Not a modal, no navigation controller: can't navigate back from \(String(describing: currentViewController))")
        }
    }
    
    func simplePop(animated: Bool) {
        if let navigationController = currentViewController?.navigationController {
            navigationController.popViewController(animated: animated)
        }
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        if let presentingModal = currentViewController?.presentingViewController {
            currentViewController?.dismiss(animated: true) {
                completion?()
            }
            currentViewController = SceneCoordinator.actualViewController(for: presentingModal)
        }
    }
    
    /// Order the current UIViewController to present a UIAlertController
    ///
    /// - Parameters:
    ///   - alert: UIAlertController to be presented
    ///   - animated: Presented with or without animation
    ///   - completion: Callback when UIAlertController is presented
    func showAlert(alert: UIAlertController, animated: Bool, completion: (() -> Void)? = nil) {
        self.currentViewController?.present(alert, animated: animated, completion: completion)
    }
    
    func showAlertView(title: String? = "", message: String? = "", action: (() -> Void)?, completion: (() -> Void)?, showCancelButton: Bool? = false) {
        let alertVew = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if showCancelButton ?? false {
            alertVew.addAction(UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil))
        }

        alertVew.addAction(UIAlertAction(title: "accept".localized, style: .default, handler: { (_) in
            action?()
        }))
        
        showAlert(alert: alertVew, animated: true, completion: completion)
    }

    func updateCurrentViewController(viewController: UIViewController) {
        currentViewController = viewController
    }

    func updateCurrentViewController(navigationController: UINavigationController) {
        guard let current = navigationController.viewControllers.last else { return }
        currentViewController = current
    }
}

// MARK: - SetupInitialScene

extension SceneCoordinator {
    
    /// Does the initial scene setup
    func setupInitialScene() {
    }
}
