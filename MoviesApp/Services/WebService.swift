//
//  WebService.swift
//  MoviesApp
//
//  Created by artembolotov on 08.09.2023.
//

import Foundation

enum NetworkError: Error {
    case badURL, decodingError, noData
}

final class WebService {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        
        guard let moviesURL = URL(string: Constants.Urls.urlBySearch(search: search)) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: moviesURL) { data, response, error in
            
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(movieResponse.movies))
            } catch {
                completion(.failure(.decodingError))
            }
                
        }.resume()
    }
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetails, NetworkError>) -> Void) {
        
        guard let detailsURL = URL(string: Constants.Urls.urlForMovieDetailsByImdbId(imdbId: imdbId)) else {
            completion(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: detailsURL) { data, responce, error in
            
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let details = try JSONDecoder().decode(MovieDetails.self, from: data)
                completion(.success(details))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
