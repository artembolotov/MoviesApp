//
//  Store.swift
//  MoviesApp
//
//  Created by artembolotov on 07.09.2023.
//

import Foundation

protocol ReduxState { }
protocol Action { }

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Middleware<State: ReduxState> = (State, Action, @escaping Dispatcher) -> Void

struct AppState: ReduxState {
    var movies = MoviesState()
}

struct MoviesState: ReduxState {
    var movies = [Movie]()
    var selectedMovieDetails: MovieDetails?
}

final class Store<StoreState: ReduxState>: ObservableObject {
    @Published private(set) var state: StoreState
    
    private var reducer: Reducer<StoreState>
    private var middlewares: [Middleware<StoreState>]
    
    init(state: StoreState, reducer: @escaping Reducer<StoreState>, middlewares: [Middleware<StoreState>] = []) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        Task { @MainActor in
            state = reducer(state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
