//
//  Session.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 7/6/21.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    private init() { }
    
    // MARK: Properties
    
    private var defaults: UserDefaults = .standard
    
    var favoritesMovies: [Movie]? {
            get {
                if let movies = defaults.object(forKey: Constants.UserDefaults.favoriteKey) as? Data {
                    let decoder = JSONDecoder()
                    if let personDataDecode = try? decoder.decode([Movie].self, from: movies) {
                        return personDataDecode
                    }
                }
                return nil
            }

            set(newValue) {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(newValue) {
                    defaults.set(encoded, forKey: Constants.UserDefaults.favoriteKey)
                }
            }
        }
}
