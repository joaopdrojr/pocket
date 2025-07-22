//
//  ListRowView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "The trip 1")
}
