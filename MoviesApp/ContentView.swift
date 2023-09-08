//
//  ContentView.swift
//  MoviesApp
//
//  Created by artembolotov on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store = Store(state: AppState(), reducer: appReducer)
    
    static var previews: some View {
        ContentView()
            .environmentObject(store)
    }
}
