//
//  SplashViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import Bond
import UIKit

final class SplashViewModel: BaseViewModel {
    
    let isLoading: Observable<Bool> = Observable(true)
    
    // MARK: - Init
    
    init(coordinator: SceneCoordinatorType?) {
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Public Methods

    func goToHome() {
        let viewModel = TabBarViewModel(coordinator: coordinator)
        coordinator.transition(to: .tabBar(viewModel), type: .root(.crossFade), completion: nil)
    }
}
