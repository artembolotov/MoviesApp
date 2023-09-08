//
//  Constants.swift
//  MoviesApp
//
//  Created by artembolotov on 08.09.2023.
//

import Foundation

struct Constants {
    
    struct ApiKeys {
        static let omdbIdKey = "70c702a9"
    }
    
    struct Urls {
        static func urlBySearch(search: String) -> String {
            "http://www.omdbapi.com/?s=\(search)&page=1&apikey=\(ApiKeys.omdbIdKey)"
        }
        
        static func urlForMovieDetailsByImdbId(imdbId: String) -> String {
            "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(ApiKeys.omdbIdKey)"
        }
    }
}
