//
//  String+localize.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
