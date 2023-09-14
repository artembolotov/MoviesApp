//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by artembolotov on 11.09.2023.
//

import Foundation

struct MovieDetails: Decodable {
    let title: String
    let plot: String
    let imdbRating: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
    }
}
