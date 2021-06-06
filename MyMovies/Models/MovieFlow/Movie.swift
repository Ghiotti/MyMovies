//
//  Movie.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

struct Movie: Decodable {
    
    var posterUrl: String?
    var isForAdult: Bool?
    var overview: String?
    var releaseDate: String?
    var movieId: Int?
    var movieName: String?
    var movieVote: Double?
    var isFavorite = false

    enum CodingKeys: String, CodingKey {
        case posterUrl = "poster_path"
        case isForAdult = "adult"
        case overview
        case releaseDate = "release_date"
        case movieId = "id"
        case movieName = "title"
        case movieVote = "vote_average"
    }

}
