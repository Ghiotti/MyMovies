//
//  APIEnvironment.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

class APIEnvironment: EnvironmentDelegate {
    
    func getImageBaseUrl() -> String {
        return Bundle.main.object(forInfoDictionaryKey: Constants.Plist.imagesBaseUrl) as? String ?? ""
    }
    
    func getBaseUrl() -> String {
        return Bundle.main.object(forInfoDictionaryKey: Constants.Plist.baseUrlKey) as? String ?? ""
    }
}

protocol EnvironmentDelegate: class {
    func path(_ endpoint: String) -> String
    func getBaseUrl() -> String
    func getImageBaseUrl() -> String
}

extension EnvironmentDelegate {
    
    func path(_ endpoint: String) -> String {
        return getBaseUrl() + endpoint
    }
    
    func pathForImage(_ endpoint: String) -> String {
        return getImageBaseUrl() + endpoint
    }
}
