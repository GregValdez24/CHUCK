//
//  HomePage.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("userRole") private var userRole: String = "parent" //default to parent mode, abstract mode selection
    @State private var selectedApps: Set<AppModel> = []
    @State private var availableApps: [AppModel] = []  // availableApps needs to be defined

    let buttons = ["Create Roster", "Edit Roster", "Chuck Roster", "View Stats"]

    var body: some View {
        NavigationStack {
            VStack {
                Text("Manage Your Rosters")
                    .font(.title2)
                    .foregroundColor(.purple)
                    .padding(.top)
                
                let columns = [GridItem(.flexible()), GridItem(.flexible())]
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(buttons, id: \.self) { buttonTitle in
                        NavigationLink(destination: getDestination(for: buttonTitle)) { 
                            ButtonView(title: buttonTitle)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    @ViewBuilder
    private func getDestination(for buttonTitle: String) -> some View {
        if buttonTitle == "Create Roster" {
            CreateRosterView(selectedApps: $selectedApps, availableApps: availableApps)
        }
        else if buttonTitle == "Chuck Roster" {
            ChuckRosterView(activateChildMode: activateChildMode)
        } else {
            Text("You selected \(buttonTitle)")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
        }
    }

    private func activateChildMode() {
        userRole = "child"
    }
}


struct ButtonView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
            .accessibilityLabel("\(title) button")
    }
}

// Preview for HomePage
#Preview {
    HomePage()
}
