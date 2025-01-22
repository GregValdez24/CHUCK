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
                Text("Welcome to CHUCK!")
            }
            
            .toolbar {
                NavigationLink {
                    Text ("Welcome Back!")
                } label : {
                    Text("Log In")
                }
            }
            
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
