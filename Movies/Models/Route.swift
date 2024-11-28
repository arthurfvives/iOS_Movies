//
//  Route.swift
//  Movies
//
//  Created by arthur.ferket on 28/11/2024.
//

import Foundation

enum Route: Hashable {
    case movie(Movie)
    case director(Director)
    case actor(Actor)
}
