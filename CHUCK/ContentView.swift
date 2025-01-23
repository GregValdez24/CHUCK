//
//  ContentView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/21/25.
//
// Mostly all things will go her in this VIEW

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome Back!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            
            .toolbar {
                NavigationLink {
                    Text ("CHUCK Log In")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
                label : {
                    Text("Log In")
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
