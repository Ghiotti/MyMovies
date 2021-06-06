//
//  BaseViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//
import UIKit
import ReactiveKit

protocol BaseViewControllerProtocol {
    func addSubviews()
    func addConstraints()
    func addStyle()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    let disposeBag = DisposeBag()
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        addStyle()
        addConfiguration()
        
        navigationItem.backButtonTitle = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateCoordinator()
    }

    /// Function to be implemented in each view controller to update the coordinator
    /// on back navigation
    open func updateCoordinator() { preconditionFailure("This method must be overriden") }
    
    open func addSubviews() { }
    
    open func addConstraints() { }
    
    open func addStyle() { }
    
    open func addConfiguration() { }
}
