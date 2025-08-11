//
//  RemoveItemIntent.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 11/08/25.
//

import AppIntents

struct RemoveItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Remove Item from Pocket"
    static var description = IntentDescription("Remove an item from your pocket list")
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Item to Remove", description: "The item you want to remove")
    var item: ItemEntity
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let success = ListViewModel.shared.removeItem(byId: item.id)
        
        if success {
            return .result(dialog: "Removed '\(item.name)' from your pocket!")
        } else {
            return .result(dialog: "Sorry, I couldn't find '\(item.name)' in your pocket.")
        }
    }
}
