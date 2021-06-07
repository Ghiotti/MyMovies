//
//  FavoriteMoviesViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import Bond

class FavoriteMoviesViewModel: BaseViewModel {
        
    var favoritesMovies: Observable<[Movie]> = Observable([])
    
    // MARK: - Init
    
    init(coordinator: SceneCoordinatorType?) {
        super.init(coordinator: coordinator)
    }
    
    // MARK: - Public Methods
    
    func getFavoritesMovies() {
        favoritesMovies.value = Session.shared.favoritesMovies ?? []
    }
    
    func removeFromFavorite(movieRow: Int) {
        favoritesMovies.value.remove(at: movieRow)
        Session.shared.favoritesMovies = favoritesMovies.value
    }
}
