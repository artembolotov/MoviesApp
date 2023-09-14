//
//  AppReducer.swift
//  MoviesApp
//
//  Created by artembolotov on 07.09.2023.
//

import Foundation

@MainActor
func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    
    state.movies = moviesReducer(state.movies, action)
    
    return state
}
