//
//  CompleteItemIntent.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 17/08/25.
//

import AppIntents

struct CompleteItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Mark Item as Done"
    static var description = IntentDescription("Mark an item in your pocket as completed")
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Item to Complete", description: "The item you want to mark as done")
    var item: ItemEntity
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let success = ListViewModel.shared.completeItem(byId: item.id)
        
        if success {
            return .result(dialog: "Marked '\(item.name)' as completed!")
        } else {
            return .result(dialog: "Sorry, I couldn't find '\(item.name)' in your pocket or it's already completed.")
        }
    }
}

struct UncompleteItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Mark Item as Pending"
    static var description = IntentDescription("Mark an item in your pocket as pending")
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Item to Mark Pending", description: "The item you want to mark as pending")
    var item: ItemEntity
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let success = ListViewModel.shared.uncompleteItem(byId: item.id)
        
        if success {
            return .result(dialog: "Marked '\(item.name)' as pending.")
        } else {
            return .result(dialog: "Sorry, I couldn't find '\(item.name)' in your pocket or it's already pending.")
        }
    }
}
