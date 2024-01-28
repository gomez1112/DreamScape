//
//  DreamScapeApp.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/27/24.
//

import SwiftData
import SwiftUI

@main
struct DreamScapeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Category.self, isUndoEnabled: true)
    }
}
