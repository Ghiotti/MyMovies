//
//  MyMoviesTests.swift
//  MyMoviesTests
//
//  Created by Franco Ghiotti on 6/6/21.
//

import XCTest
@testable import MyMovies

class MyMoviesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMarkAsFavorite() throws {
        // given
        let movies = [Movie(), Movie(), Movie(), Movie(), Movie()]
        let viewmodel = HomeViewModel(coordinator: nil, movieService: NetworkManager())
        viewmodel.movieToShow.value = movies
    
        // when
        viewmodel.markAsFavorite(movieNumber: 2)

        // then
        XCTAssertEqual(viewmodel.movieToShow.value[2].isFavorite, true)
    }
    
    func testUnmarkAsFavorite() throws {
        // given
        let movies = [Movie(), Movie(), Movie(), Movie(), Movie()]
        let viewmodel = HomeViewModel(coordinator: nil, movieService: NetworkManager())
        viewmodel.movieToShow.value = movies
    
        // when
        viewmodel.markAsFavorite(movieNumber: 2)
        viewmodel.markAsFavorite(movieNumber: 2)

        // then
        XCTAssertEqual(viewmodel.movieToShow.value[2].isFavorite, false)
    }
    
    func testRemoveFromFavorite() {
        // given
        let movies = [Movie(), Movie(), Movie(), Movie(), Movie()]
        let viewmodel = FavoriteMoviesViewModel(coordinator: nil)
        viewmodel.favoritesMovies.value = movies

        //when
        viewmodel.removeFromFavorite(movieRow: 2)
        
        //then
        XCTAssertEqual(viewmodel.favoritesMovies.value.count, 4)
    }
}
