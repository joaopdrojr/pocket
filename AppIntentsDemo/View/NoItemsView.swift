//
//  NoItemsView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 13/08/25.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("Hey there!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Missing something in your backpack? \n Pocket is here to help!")
                NavigationLink(destination: AddView()) {
                    Text("Add an item to your pocket 🎒")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.main)
                        .cornerRadius(10)
                }
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationView{
        NoItemsView()
            .navigationTitle("AAA")
    }
}
