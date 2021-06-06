//
//  TabBarViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

final class TabBarViewModel: BaseViewModel {
        
    let homeViewModel: HomeViewModel
    let favoriteViewModel: FavoriteMoviesViewModel

    // MARK: Init
    
    init(coordinator: SceneCoordinatorType?) {
        self.homeViewModel = HomeViewModel(coordinator: coordinator, movieService: NetworkManager())
        self.favoriteViewModel = FavoriteMoviesViewModel(coordinator: coordinator)
        super.init(coordinator: coordinator)
    }
}
