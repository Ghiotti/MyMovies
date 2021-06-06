//
//  BaseResponse.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

class BaseResponse: Decodable {
    
    var page: Int?
    var results: [Movie]?
}
