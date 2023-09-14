//
//  Movie.swift
//  MoviesApp
//
//  Created by artembolotov on 08.09.2023.
//

import Foundation

struct Movie: Identifiable, Decodable {
    let title: String
    let poster: String
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case poster = "Poster"
        case id = "imdbID"
    }
}

struct MovieResponse: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
