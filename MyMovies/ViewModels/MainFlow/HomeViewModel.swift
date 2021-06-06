//
//  HomeViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import Bond

class HomeViewModel: BaseViewModel {
        
    var movieToShow: Observable<[Movie]> = Observable([])
    var mostPopularsMovies: Observable<[Movie]> = Observable([])
    var searchMovies: Observable<[Movie]> = Observable([])
    let movieService: MovieServiceDelegate
    
    private var homeCurrentPage = 1
    private var isLoading = false

    // MARK: Init
    
    init(coordinator: SceneCoordinatorType?, movieService: MovieServiceDelegate) {
        self.movieService = movieService
        super.init(coordinator: coordinator)
        fetchMostPopularsMoviews()
    }
    
    func searchMovie(fromName name: String?) {
        guard let movieName = name else {
            movieToShow.value = mostPopularsMovies.value

            return
        }
        
        if movieName.isEmpty {
            movieToShow.value = mostPopularsMovies.value
            
            return
        }
        
        // search movie
    }
    
    func checkPagination(movieNumber: Int) {
        if movieNumber == movieToShow.value.count - 2 {
            homeCurrentPage += 1
            fetchMostPopularsMoviews()
        }
    }

    // MARK: Private Methods

    private func fetchMostPopularsMoviews() {
        if isLoading { return }
        isLoading = true
        movieService.fetchMostPopularMovies(page: homeCurrentPage) { movies, error in
            if let error = error {
                debugPrint(error)
                self.isLoading = false
                self.showError(message: error.localizedDescription)
                
                return
            }
            
            guard let movies = movies?.results else {
                self.showError(message: "unexpected_error".localized)
                return
            }
            
            self.mostPopularsMovies.value = self.mostPopularsMovies.value + movies
            self.movieToShow.value = self.movieToShow.value + movies
            self.isLoading = false
        }
    }
        
    private func showError(message: String) {
        coordinator.showAlertView(title: "Error", message: message, action: nil, completion: nil, showCancelButton: nil)
    }
}
