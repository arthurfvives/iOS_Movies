//
//  PathStore.swift
//  Movies
//
//  Created by arthur.ferket on 26/11/2024.
//

import Foundation
import SwiftUI

@Observable
class PathStore {
    var path = [Route]()
    
    init() {
        path = [Route]() // initialiseren van array
    }
    
    func getPath() -> [Route] {
        return path
    }
    
    func clear() {
        path.removeAll()
    }
    
    func reduceArray(index: Int) {
        path = Array(path.prefix(index+1))
    }
}
