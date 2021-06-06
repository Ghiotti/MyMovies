//
//  APIClient.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Alamofire

class APICLient {
    
    func getEntity<T: BaseResponse>(
        endpoint: String,
        parameters: [String: Any]? = nil,
        environment: EnvironmentDelegate? = nil,
        completion:@escaping (_ entity: T?, _ error: Error?) -> Void) {
        createRequest(
            endpoint: endpoint,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.default,
            environment: environment)
            .responseDecodable(of: T.self) { (response) in
                APIErrorHandler().validateResponse(response, completion: { (entity, error) in
                    completion(entity, error)
                })
            }
    }
    
    func createRequest(
        endpoint: String,
        method: Alamofire.HTTPMethod,
        parameters: [String: Any]?,
        encoding: ParameterEncoding,
        environment: EnvironmentDelegate? = nil) -> DataRequest {

        var urlString = APIEnvironment().path(endpoint)
        if let environment = environment {
            urlString = environment.path(endpoint)
        }
        
        let params = parameters ?? [:]

        debugPrint(urlString)
        let request = AF.request(urlString, method: method, parameters: params, encoding: encoding)
            .responseString { response in
                debugPrint("Request: \(response.debugDescription)")
                debugPrint("Response: \(response)")
        }
        
        return request
    }
}
