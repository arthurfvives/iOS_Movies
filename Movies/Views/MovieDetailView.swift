//
//  MovieDetailView.swift
//  Movies
//
//  Created by arthur.ferket on 28/11/2024.
//

import SwiftUI

struct MovieDetailView: View {
    var selectedMovie: Movie
    @State var selectedActor: Actor?
    var body: some View {
        VStack{
            Text(selectedMovie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
            Text(selectedMovie.description)
            Divider()
            Spacer()
            Text("Actors").bold()
            List(selectedMovie.actors, id: \.self, selection: $selectedActor) {actor in
                NavigationLink(value: Route.actor(actor)) {
                    Text(actor.firstName + " " + actor.lastName)
                }.foregroundStyle(.red)
            }
            Divider()
            Text("Director").bold()
            NavigationLink(value: Route.director(selectedMovie.director)) {
                Text(selectedMovie.director.firstName).foregroundStyle(.red)
            }
            Spacer()
            Divider()
            OverviewNavigationPathView()
        }
    }
}


