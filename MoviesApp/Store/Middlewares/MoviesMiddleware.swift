//
//  MoviesMiddleware.swift
//  MoviesApp
//
//  Created by artembolotov on 09.09.2023.
//

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
        case let action as FetchMovies:
            WebService().getMoviesBy(search: action.search.urlEncode()) { result in
                switch result {
                case .success(let movies):
                    dispatch(SetMoview(movies: movies))
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case let action as FetchMovieDetails:
            WebService().getMovieDetailsBy(imdbId: action.imdbId) { result in
                switch result {
                case .success(let details):
                    dispatch(SetMovieDetails(details: details))
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        default:
            break
        }
    }
}
