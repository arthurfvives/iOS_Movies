//
//  MovieListView.swift
//  Movies
//
//  Created by arthur.ferket on 26/11/2024.
//

import SwiftUI

struct MovieListView: View {
    @State var selectedMovie: Movie?
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var dataStore
    var body: some View {
        @Bindable var pathStore = pathStore
        NavigationStack(path: $pathStore.path){
            List(dataStore.getMovies(), id: \.self, selection: $selectedMovie) {movie in
                NavigationLink(value: Route.movie(movie)) {
                    VStack(alignment: .leading){
                        Text(movie.title).bold()
                        Text(movie.description).italic()
                    }
                }
                
            }.navigationDestination(for: Route.self) { route in
                switch route {
                case let .actor(a):
                    ActorDetailView(selectedActor: a)
                case let .movie(m):
                    MovieDetailView(selectedMovie: m)
                case let .director(d):
                    DirectorDetailView(selectedDirector: d)
                }
            }
        }
    }
}
