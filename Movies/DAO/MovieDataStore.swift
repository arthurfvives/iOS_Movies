//
//  MovieDataStore.swift
//  Movies
//
//  Created by arthur.ferket on 26/11/2024.
//

import Foundation
@Observable

class MovieDataStore {
    private var movies: [Movie]
    
    init() {
        let moviesJson: Movies = load("movies.json")
        movies = moviesJson.movies
        movies = sort()
        
    }
    
    func getMovies() -> [Movie] {
        return movies;
    }
    
    func sort() -> [Movie] {
        return movies.sorted { movie1, movie2 in
            movie1.title < movie2.title
        }
    }
}
