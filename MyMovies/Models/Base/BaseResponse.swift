//
//  BaseResponse.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

class BaseResponse: Decodable {
    
    var success: Bool?
    var message: String?
    var code: Int?

    private enum CodingKeys: String, CodingKey {
        case message = "mensaje"
        case code = "codigo"
        case success = "success"
    }
}
