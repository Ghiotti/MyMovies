//
//  MovieService.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

protocol MovieServiceDelegate {
    
    func fetchMostPopularMovies(page: Int, completion:@escaping (_ response: BaseResponse?, _ error: Error?) -> Void)
}

extension NetworkManager: MovieServiceDelegate {
    func fetchMostPopularMovies(page: Int, completion: @escaping (BaseResponse?, Error?) -> Void) {
        let params = ["page": page]
        APICLient().getEntity(
            endpoint: Constants.Endpoints.mostPopularsMovies,
            parameters: params)
        { (response: MovieResponse?, error) in
                completion(response, error)
            }
    }
}
