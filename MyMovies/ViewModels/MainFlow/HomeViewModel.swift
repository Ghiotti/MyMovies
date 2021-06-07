//
//  HomeViewModel.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import Alamofire
import Bond

class HomeViewModel: BaseViewModel {
        
    var movieToShow: Observable<[Movie]> = Observable([])
    var mostPopularsMovies: Observable<[Movie]> = Observable([])
    var searchMovies: Observable<[Movie]> = Observable([])
    let movieService: MovieServiceDelegate
    
    private var homeCurrentPage = 1
    private var isLoading = false
    private var currentSearch: DataRequest?
    private var isTextSearch = false

    // MARK: - Init
    
    init(coordinator: SceneCoordinatorType?, movieService: MovieServiceDelegate) {
        self.movieService = movieService
        super.init(coordinator: coordinator)
        fetchMostPopularsMoviews()
    }
    
    // MARK: - Public Methods

    func searchMovie(fromName name: String?) {
        guard let movieName = name else {
            movieToShow.value = mostPopularsMovies.value
            isTextSearch = false
            procesMovies()
            
            return
        }
        
        if movieName.isEmpty {
            movieToShow.value = mostPopularsMovies.value
            isTextSearch = false
            procesMovies()
            
            return
        }
        
        isTextSearch = true
        currentSearch?.cancel()
        
        currentSearch = movieService.fetchMovirByTitle(title: movieName, completion: { movies, _ in
            guard let movies = movies?.results else {
                self.movieToShow.value = []
                
                return
            }
            
            self.movieToShow.value = movies
            self.procesMovies()
        })
    }
    
    func checkPagination(movieNumber: Int) {
        if isTextSearch { return }
        if movieNumber == movieToShow.value.count - 2 {
            homeCurrentPage += 1
            fetchMostPopularsMoviews()
        }
    }
    
    
    // TODO: We can use Core Data to save the favorites movies
    func markAsFavorite(movieNumber: Int) {
        movieToShow.value[movieNumber].isFavorite = !(movieToShow.value[movieNumber].isFavorite ?? false)
 
        guard var favoritesMovies = Session.shared.favoritesMovies else {
            Session.shared.favoritesMovies = [movieToShow.value[movieNumber]]

            return
        }
        
        if favoritesMovies.isEmpty && movieToShow.value[movieNumber].isFavorite ?? false {
            Session.shared.favoritesMovies = [movieToShow.value[movieNumber]]

            return
        }
        
        let index = favoritesMovies.firstIndex { movie in
            return movie.movieId == movieToShow.value[movieNumber].movieId
        }
        
        if let movieIndex = index?.asSectionDataIndexPath.row {
            favoritesMovies.remove(at: movieIndex)
            Session.shared.favoritesMovies = favoritesMovies
        } else {
            favoritesMovies.append(movieToShow.value[movieNumber])
            Session.shared.favoritesMovies = favoritesMovies
        }
    }
    
    func procesMovies() {
        guard let favoriteMovies = Session.shared.favoritesMovies else {
            return
        }
        
        for (index, _) in movieToShow.value.enumerated() {
            movieToShow.value[index].isFavorite = false
        }
        
        for favMovie in favoriteMovies {
            let index = movieToShow.value.firstIndex { movie in
                return movie.movieId == favMovie.movieId
            }
            
            if let index = index?.asSectionDataIndexPath.row {
                movieToShow.value[index].isFavorite = true
            }
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
            self.procesMovies()
            self.isLoading = false
        }
    }
        
    private func showError(message: String) {
        coordinator.showAlertView(title: "Error", message: message, action: nil, completion: nil, showCancelButton: nil)
    }
}
