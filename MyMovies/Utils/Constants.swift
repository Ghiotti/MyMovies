//
//  Constants.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

struct Constants {
    
    struct Error {
        static let domain = "com.ghiotti.franco.MyMovies"
        static let defaultMessage = "unexpected_error".localized
    }

    struct Plist {
        static let baseUrlKey = "BaseUrl"
    }

    struct Endpoints {
    }
        
    struct ReuseIdentifiers {
    }
    
    struct Lottie {
        static let splash = "SplashLottieAnimation"
    }
    
    static let defaultCornerRadius: Float = 5
    static let defaultAnimationDuration = 0.3
}
