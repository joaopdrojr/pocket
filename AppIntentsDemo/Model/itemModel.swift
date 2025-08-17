//
//  itemModel.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    let id: String
    var name: String
    var isChecked: Bool
    
    init(id: String = UUID().uuidString, name: String, isChecked: Bool){
        self.id = id
        self.name = name
        self.isChecked = isChecked
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, name: name, isChecked: !isChecked)
    }
}


