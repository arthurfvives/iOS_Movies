//
//  DirectorDetailView.swift
//  Movies
//
//  Created by arthur.ferket on 28/11/2024.
//

import SwiftUI

struct DirectorDetailView: View {
    @Environment(MovieDataStore.self) var dataStore
    var selectedDirector: Director
    var body: some View {
        VStack{
            Text("Director: \(selectedDirector.firstName) \(selectedDirector.lastName)")
            Spacer()
            Divider()
            Text("Movie(s)")
            List(dataStore.getMovies(director: selectedDirector), id: \.self) {movie in
                NavigationLink(value: Route.movie(movie)) {
                    Text(movie.title)
                }.foregroundStyle(.red)
            }
            Spacer()
            Divider()
            Text("Actors work with:")
            ForEach(dataStore.getActors(director: selectedDirector), id: \.self) { actor in
                NavigationLink(value: Route.actor(actor)) {
                    Text("\(actor.firstName) \(actor.lastName)")
                }.foregroundStyle(.red)
            }
            Spacer()
            Divider()
            OverviewNavigationPathView()
            
        }
        
        
    }
}
