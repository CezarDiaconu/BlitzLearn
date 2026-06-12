//
//  learnApp.swift
//  learn
//
//  Created by Cezar Diaconu on 02.06.2026.
//

import SwiftUI
import SwiftData

@main
struct learnApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

