//
//  MovieService.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation
import Alamofire

protocol MovieServiceDelegate {
    
    func fetchMostPopularMovies(page: Int, completion:@escaping (_ response: BaseResponse?, _ error: Error?) -> Void)
    func fetchMovirByTitle(title: String, completion:@escaping (_ response: BaseResponse?, _ error: Error?) -> Void) -> DataRequest
}

extension NetworkManager: MovieServiceDelegate {
    func fetchMostPopularMovies(page: Int, completion: @escaping (BaseResponse?, Error?) -> Void) {
        let params = ["page": page]
        APICLient().getEntity(
            endpoint: Constants.Endpoints.mostPopularsMovies,
            parameters: params) { (response: MovieResponse?, error) in
                completion(response, error)
            }
    }
    
    func fetchMovirByTitle(title: String, completion:@escaping (_ response: BaseResponse?, _ error: Error?) -> Void) -> DataRequest {
        let params = ["query": title]
        return APICLient().getEntity(
                endpoint: Constants.Endpoints.searchByTitle,
                parameters: params) { (response: MovieResponse?, error) in
                    completion(response, error)
            }
    }

}
