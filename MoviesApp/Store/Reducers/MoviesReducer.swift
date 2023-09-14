//
//  MoviesReducer.swift
//  MoviesApp
//
//  Created by artembolotov on 09.09.2023.
//

import Foundation

@MainActor func moviesReducer(_ state: MoviesState, _ action: Action) -> MoviesState {
    var state = state
    
    switch action {
    case let action as SetMoview:
        state.movies = action.movies
        
    case let action as SetMovieDetails:
        state.selectedMovieDetails = action.details
        
    default:
        break
    }
    
    return state
}
