//
//  MoodleAppApp.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import SwiftUI

@main
struct MoodleAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
