//
//  APIErrorHandler.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//
import Foundation
import Alamofire

class APIErrorHandler {
    
    func validateResponse<T: BaseResponse>(_ response: AFDataResponse<T>, completion:(_ entity: T?, _ error: Error?) -> Void) {
        if let entity = response.value {
            completion(entity, nil)
        } else {
            let error = NSError(
                domain: Constants.Error.domain,
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: Constants.Error.defaultMessage])
            
            completion(nil, error as Error)
        }
    }
}
