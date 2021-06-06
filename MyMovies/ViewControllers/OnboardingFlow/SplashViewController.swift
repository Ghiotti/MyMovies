//
//  SplashViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
import Lottie

class SplashViewController: BaseViewController {
    
    var viewModel: SplashViewModel!
    
    private var animationView = AnimationView.init(name: Constants.Lottie.splash)

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpAnimation()
    }
    
    // MARK: - BaseViewController

    override func updateCoordinator() { }

    override func addSubviews() {
        view.addSubview(animationView)
    }
    
    override func addStyle() {
    }
    
    override func addConstraints() {
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUpAnimation() {
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.5
        animationView.play { [weak self] _ in
            self?.viewModel.goToHome()
        }
    }
}

    // MARK: - Bindable

extension SplashViewController: Bindable {
    
    func bindViewModel() {
    }
}
