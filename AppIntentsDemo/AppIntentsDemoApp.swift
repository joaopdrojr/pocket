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
                "Add \(\.$itemName) to pocket"
            ],
            shortTitle: "Add to Pocket",
            systemImageName: "plus.circle"
        )
        
        AppShortcut(
            intent: RemoveItemIntent(),
            phrases: [
                "Remove \(\.$item) from pocket"
            ],
            shortTitle: "Remove from Pocket",
            systemImageName: "minus.circle"
        )
        
        AppShortcut(
            intent: CompleteItemIntent(),
            phrases: [
                "Mark \(\.$item) as done"
            ],
            shortTitle: "Mark as Done",
            systemImageName: "checkmark.circle"
        )
        
        AppShortcut(
            intent: UncompleteItemIntent(),
            phrases: [
                "Mark \(\.$item) as pending"
            ],
            shortTitle: "Mark as Pending",
            systemImageName: "arrow.counterclockwise.circle"
        )
    }
}
