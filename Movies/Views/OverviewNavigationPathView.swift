//
//  OverviewNavigationPathView.swift
//  Movies
//
//  Created by arthur.ferket on 02/12/2024.
//

import SwiftUI

struct OverviewNavigationPathView: View {
    @Environment(PathStore.self) var pathStore
    var body: some View {
        VStack{
            Text("Overview navigationStack")
            ForEach(Array(pathStore.path.enumerated()), id: \.offset) { index, route in
                switch route {
                case let .actor(a):
                    Button("Actor \(a.firstName) \(a.lastName)") {
                        pathStore.reduceArray(index: index)
                    }
                case let .movie(m):
                    Button("Movie \(m.title)") {
                        pathStore.reduceArray(index: index)
                    }
                case let .director(d):
                    Button("Director \(d.firstName) \(d.lastName)") {
                        pathStore.reduceArray(index: index)
                    }
                }
            }
            Button("Clear") {
                pathStore.clear()
            }
        }
    }
}
