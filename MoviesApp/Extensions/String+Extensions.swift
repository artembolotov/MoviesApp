//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by artembolotov on 08.09.2023.
//

import Foundation

extension String {
    
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    func toInt() -> Int {
        let ratingDouble = Double(self) ?? 0.0
        return Int(ratingDouble.rounded())
    }
    
}
