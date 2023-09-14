//
//  ContentView.swift
//  MoviesApp
//
//  Created by artembolotov on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var search = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        return Props(movies: state.movies, onSearch: { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
            
        List(props.movies) { movie in
            NavigationLink(destination: MovieDetailsView(movie: movie)) {
                MovieCell(movie: movie)
            }
        }
        .listStyle(.plain)
        .searchable(text: $search)
        .navigationTitle("Movies")
        .embedInNavigationView()

        .onChange(of: search) { keyword in
            props.onSearch(keyword)
        }
    }
}

struct MovieCell: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store = Store(state: AppState(), reducer: appReducer, middlewares: [moviesMiddleware()])
    
    static var previews: some View {
        ContentView()
            .environmentObject(store)
    }
}
