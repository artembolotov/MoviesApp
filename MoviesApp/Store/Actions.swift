//
//  Axtions.swift
//  MoviesApp
//
//  Created by artembolotov on 09.09.2023.
//

import Foundation

struct FetchMovies: Action {
    let search: String
}

struct SetMoview: Action {
    let movies: [Movie]
}

struct FetchMovieDetails: Action {
    let imdbId: String
}

struct SetMovieDetails: Action {
    let details: MovieDetails
}
