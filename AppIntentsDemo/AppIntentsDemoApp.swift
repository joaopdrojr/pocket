//
//  AppIntentsDemoApp.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 30/05/25.
//

import SwiftUI
import AppIntents

@main
struct AppIntentsDemoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

struct PocketShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddItemIntent(),
            phrases: [
                "Add \(\.$itemName) to my pocket",
                "Put \(\.$itemName) in pocket",
                "Pocket \(\.$itemName)",
                "Add \(\.$itemName) to pocket list"
            ],
            shortTitle: "Add to Pocket",
            systemImageName: "plus.circle"
        )
        
        AppShortcut(
            intent: RemoveItemIntent(),
            phrases: [
                "Remove \(\.$item) from pocket",
                "Delete \(\.$item) from my pocket",
                "Take out \(\.$item)",
                "Remove \(\.$item) from pocket list"
            ],
            shortTitle: "Remove from Pocket",
            systemImageName: "minus.circle"
        )
    }
}
