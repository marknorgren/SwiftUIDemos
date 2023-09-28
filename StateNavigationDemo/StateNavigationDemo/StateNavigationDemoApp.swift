//
//  StateNavigationDemoApp.swift
//  StateNavigationDemo
//
//  Created by mark on 9/28/23.
//

import SwiftUI
import SwiftData

@main
struct StateNavigationDemoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Label("Content", systemImage: "1.square.fill")
                }

                NavigationView {
                    LearningPhaseTab()
                }
                .tabItem {
                    Label("Learning", systemImage: "2.square.fill")
                }
            }
            .modelContainer(sharedModelContainer)
        }
    }
}
