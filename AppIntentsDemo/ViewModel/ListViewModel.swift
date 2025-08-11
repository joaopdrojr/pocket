//
//  ListViewModel.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 24/07/25.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
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
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

extension ListViewModel {
    
    static let shared = ListViewModel()
    
    func getAllItemEntities() -> [ItemEntity] {
        return items.map { ItemEntity(from: $0) }
    }
    
    func removeItem(byId id: String) -> Bool {
        guard let index = items.firstIndex(where: { $0.id == id }) else {
            return false
        }
        items.remove(at: index)
        return true
    }
    
    func addItemViaIntent(name: String) {
        addItems(title: name)
    }
}
    
    
