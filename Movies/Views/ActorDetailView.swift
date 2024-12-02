//
//  ActorDetailView.swift
//  Movies
//
//  Created by arthur.ferket on 28/11/2024.
//

import SwiftUI

struct ActorDetailView: View {
    @Environment(MovieDataStore.self) var dataStore
    var selectedActor: Actor
    var body: some View {
        VStack{
            Text("Actor: \(selectedActor.firstName) \(selectedActor.lastName)")
            Divider()
            Text("Birthday: \(selectedActor.birthday)")
            Spacer()
            Divider()
            Text("Movie(s)")
            ForEach(dataStore.getMovies(actor: selectedActor), id: \.self) {movie in
                NavigationLink(value: Route.movie(movie)) {
                    Text(movie.title)
                }.foregroundStyle(.red)
            }
            Spacer()
            Divider()
            OverviewNavigationPathView()
        }
        
    }
}
