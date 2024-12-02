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
    
    func getMovies(actor: Actor) -> [Movie] {
        let movies = movies.filter {movie in
            movie.actors.contains(actor)
        }
        return movies
    }
    
    func getMovies(director: Director) -> [Movie] {
        let movies = movies.filter {movie in
            movie.director == director
        }
        return movies
    }
    
    func getActors(director: Director) -> [Actor] {
        let movies = getMovies(director: director)
        var actors = [Actor]()
        for movie in movies {
            for actor in movie.actors {
                actors.append(actor)
            }
        }
        return Array(Set(actors))
    }
        
    func sort() -> [Movie] {
        return movies.sorted { movie1, movie2 in
            movie1.title < movie2.title
        }
    }
}
