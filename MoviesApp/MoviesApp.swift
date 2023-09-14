//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by artembolotov on 07.09.2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    @StateObject var store = Store(state: AppState(), reducer: appReducer, middlewares: [moviesMiddleware()])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
