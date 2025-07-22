//
//  ContentView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 30/05/25.
//

import SwiftUI

struct ListView: View {
    @State var trips: [String] = [
        "First trip",
        "Second trip",
        "Third trip"
    ]
    
    var body: some View {
        List{
            ForEach(trips, id: \.self) { trip in
                ListRowView(title: trip)
            }
        }
        .navigationTitle("Your Trips")
        .navigationBarItems(leading: EditButton(), trailing:
                                NavigationLink("Add", destination: AddView()))
    }
}


#Preview {
    NavigationView{
        ListView()
    }
}
