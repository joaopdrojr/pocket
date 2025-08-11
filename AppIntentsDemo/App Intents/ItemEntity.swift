//
//  ItemEntity.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 11/08/25.
//

import Foundation
import AppIntents

struct ItemEntity: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Pocket Item"
    static var defaultQuery = ItemQuery()
    
    var id: String
    var name: String
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }
    
    init(from itemModel: ItemModel) {
        self.id = itemModel.id
        self.name = itemModel.name
    }
}

struct ItemQuery: EntityQuery {
    func entities(for identifiers: [String]) async throws -> [ItemEntity] {
        return ListViewModel.shared.getAllItemEntities().filter { item in
            identifiers.contains(item.id)
        }
    }
    
    func suggestedEntities() async throws -> [ItemEntity] {
        return ListViewModel.shared.getAllItemEntities()
    }
}
