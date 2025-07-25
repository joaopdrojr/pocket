//
//  ListViewModel.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 24/07/25.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(name: "Baggy Jeans", isChecked: false),
            ItemModel(name: "T-shirt", isChecked: true),
            ItemModel(name: "Hoddie", isChecked: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(title: String){
        let newItem = ItemModel(name: title, isChecked: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
}
