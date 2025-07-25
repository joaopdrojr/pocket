//
//  ItemListRowView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import SwiftUI

struct ItemListRowView: View {
    let items: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: items.isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(items.isChecked ? .green : .black)
            
            Text(items.name)
            
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

#Preview {
    ItemListRowView(items: .init(name: "T-Shirt", isChecked: true))
    ItemListRowView(items: .init(name: "Pants", isChecked: false))
}
