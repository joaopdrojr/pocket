//
//  DetailView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import SwiftUI

struct DetailView: View {
    @State var items: [ItemModel] = [
        ItemModel(itemName: "Baggy Jeans", isChecked: false),
        ItemModel(itemName: "T-shirt", isChecked: true),
        ItemModel(itemName: "Hoddie", isChecked: false)
    ]
    
    @State public var tripName: String = "My trip"
    
    
    var body: some View {
        List{
            ForEach(items) { item in
                HStack{
                    ItemListRowView(items: item)
                    
                }
            }
        }
         .navigationTitle("YOUR TRIP NAME HERE")
    }
}
    

#Preview {
    NavigationView{
        DetailView()
    }
}
