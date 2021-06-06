//
//  TabBarViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class TabBarViewController: BaseTabBarController, Bindable {

    private var homeViewController = HomeViewController()
    private var favoriteMoviesViewController = FavoriteMoviesViewController()

    var viewModel: TabBarViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: Bindable
    
    func bindViewModel() {
        viewModel.homeViewModel.coordinator = viewModel.coordinator.buildNestedCoordinator(for: homeViewController)
        homeViewController.bind(to: viewModel.homeViewModel)

        viewModel.favoriteViewModel.coordinator = viewModel.coordinator.buildNestedCoordinator(for: favoriteMoviesViewController)
        favoriteMoviesViewController.bind(to: viewModel.favoriteViewModel)
    }
    
    // MARK: BaseTabBarControllerProtocol

    override func addConfiguration() {
        homeViewController.tabBarItem = UITabBarItem(title: "movies".localized, image: TabBarAssets.movie.image, tag: 0)
        favoriteMoviesViewController.tabBarItem = UITabBarItem(title: "favorite".localized, image: TabBarAssets.favorite.image, tag: 0)

        tabBar.tintColor = .secondaryLabel
        tabBar.isTranslucent = false

        setViewControllers([homeViewController, favoriteMoviesViewController], animated: true)
}
    
    override func addStyle() {
        UITabBar.appearance().barTintColor = .primary
        UITabBar.appearance().tintColor = .secondary
    }

    override func updateCoordinator() { }
}
