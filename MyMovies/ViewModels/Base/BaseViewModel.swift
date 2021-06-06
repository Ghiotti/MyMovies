//
//  BaseViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import ReactiveKit

class BaseViewModel: NSObject {
    
    var coordinator: SceneCoordinatorType!
    var transitionHandler: (() -> Void)?

    let disposeBag: DisposeBag
    
    init(coordinator: SceneCoordinatorType? = nil, transitionHandler: (() -> Void)? = nil) {
        self.coordinator = coordinator
        self.transitionHandler = transitionHandler
        self.disposeBag = DisposeBag()
    }
    
    func updateCoordinator(navigationController: UINavigationController) {
        coordinator.updateCurrentViewController(navigationController: navigationController)
    }

    func updateCoordinator(viewController: UIViewController) {
        coordinator.updateCurrentViewController(viewController: viewController)
    }
    
    func showAlertView(title: String? = "warning".localized, message: String) {
        let controller = UIAlertController(title: title,
                                           message: message,
                                           preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "accept".localized, style: .default, handler: nil))
        coordinator.showAlert(alert: controller, animated: true, completion: nil)
    }
    
    func showAlertView(
        title: String? = "warning".localized,
        message: String,
        cancelTitle: String? = "cancel".localized,
        cancelHandler: ((UIAlertAction) -> Void)? = nil,
        acceptTitle: String? = "accept".localized,
        acceptHandler: ((UIAlertAction) -> Void)? = nil) {
        
        let controller = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        if let cancelTitle = cancelTitle {
            controller.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        }
        
        controller.addAction(UIAlertAction(title: acceptTitle, style: .default, handler: acceptHandler))
        coordinator.showAlert(alert: controller, animated: true, completion: nil)
    }
}
