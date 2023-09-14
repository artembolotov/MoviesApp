//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by artembolotov on 11.09.2023.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @EnvironmentObject var store: Store<AppState>
    let movie: Movie
    
    struct Props {
        let details: MovieDetails?
        let onLoadMovieDetails: (String) ->  Void
    }
    
    private func map(state: MoviesState) -> Props {
        Props(details: state.selectedMovieDetails, onLoadMovieDetails: { imdbId in
            store.dispatch(action: FetchMovieDetails(imdbId: imdbId))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        
        VStack(alignment: .leading) {
            Group {
                if let details = props.details {
                    HStack {
                        Spacer()
                        URLImage(url: details.poster)
                        Spacer()
                    }
                    
                    Text(details.title)
                        .font(.title)
                        .padding(5)
                    
                    Text(details.plot)
                        .padding(5)
                     
                    HStack {
                        Text("Rating")
                        RatingView(rating: .constant(details.imdbRating.toInt()))
                    }
                    .padding(5)

                    Spacer()
                } else {
                    Text("Loading...")
                }
            }
            .onAppear {
                props.onLoadMovieDetails(movie.id)
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static let store = Store(state: AppState(), reducer: appReducer, middlewares: [moviesMiddleware()])
    
    static var previews: some View {
        MovieDetailsView(movie: Movie(title: "batman", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", id: "tt4853102"))
            .environmentObject(store)
    }
}
