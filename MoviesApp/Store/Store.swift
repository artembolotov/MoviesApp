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
    
}

@MainActor
final class Store<StoreState: ReduxState>: ObservableObject {
    @Published var state: StoreState
    
    var reducer: Reducer<StoreState>
    var middlewares: [Middleware<StoreState>]
    
    init(state: StoreState, reducer: @escaping Reducer<StoreState>, middlewares: [Middleware<StoreState>] = []) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
}
