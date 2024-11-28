//
//  MoviesApp.swift
//  Movies
//
//  Created by arthur.ferket on 26/11/2024.
//

import SwiftUI

@main
struct MoviesApp: App {
    @State var dataStore = MovieDataStore()
    @State var pathStore = PathStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataStore).environment(pathStore)
        }
    }
}
