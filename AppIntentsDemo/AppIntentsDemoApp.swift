//
//  AppIntentsDemoApp.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 30/05/25.
//

import SwiftUI

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
