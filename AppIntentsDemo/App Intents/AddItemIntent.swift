//
//  AddItemIntent.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 11/08/25.
//

import AppIntents

struct AddItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Add Item to Pocket"
    static var description = IntentDescription("Add a new item to your pocket list")
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Item Name", description: "The name of the item to add")
    var itemName: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard !itemName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            throw $itemName.needsValueError("Please provide an item name")
        }
        
        ListViewModel.shared.addItemViaIntent(name: itemName)
        
        return .result(dialog: "Added '\(itemName)' to your pocket!")
    }
}
