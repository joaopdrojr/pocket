//
//  AddView.swift
//  AppIntentsDemo
//
//  Created by Joao Pedro Junior on 22/07/25.
//

import SwiftUI

struct AddView: View {
    @State var tripName: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Trip Name...", text: $tripName)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.secondary)
                    .cornerRadius(10)
                
                Button{
                    
                } label:{
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new Trip")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
