//
//  APIEnvironment.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

class APIEnvironment: EnvironmentDelegate {
    
    func getBaseUrl() -> String {
        return Bundle.main.object(forInfoDictionaryKey: Constants.Plist.baseUrlKey) as? String ?? ""
    }
}

protocol EnvironmentDelegate: class {
    func path(_ endpoint: String) -> String
    func getBaseUrl() -> String
}

extension EnvironmentDelegate {
    
    func path(_ endpoint: String) -> String {
        return getBaseUrl() + endpoint
    }
}
