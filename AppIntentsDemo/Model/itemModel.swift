//
//  itemModel.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import Foundation

struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    var itemName: String
    var isChecked: Bool
}


