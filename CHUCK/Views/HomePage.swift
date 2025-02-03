//
//  HomePage.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("userRole") private var userRole: String = ""
    @State private var selectedApps: Set<AppModel> = []
    @State private var availableApps: [AppModel] = []  // availableApps needs to be defined

    let buttons = ["Create Roster", "Edit Roster", "Chuck Roster", "View Stats"]

    var body: some View {
        NavigationStack {
            VStack {
                if userRole.isEmpty {
                    Text("Welcome!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                        .padding(.top)
                }

                if !userRole.isEmpty {
                    HStack {
                        // Current Mode text
                        Text("Current Mode: \(userRole == "parent" ? "Editing" : "Locking In")")
                            .font(.title3)
                            .padding(.top)
                            .foregroundColor(.purple)

                        Spacer()

                        NavigationLink(destination: RoleSelectionView()) {
                            Button("Change Mode") {
                                userRole = ""
                            }
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top)
                            .padding(.trailing)
                        }
                    }
                }

                if userRole.isEmpty {
                    Text("Please select your Mode:")
                        .font(.title3)
                        .padding()

                    NavigationLink("Select Your Mode", destination: RoleSelectionView())
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } else {
                    VStack {
                        if userRole == "parent" {
                            VStack {
                                Text("Manage Your Rosters")
                                    .font(.title2)
                                    .foregroundColor(.purple)
                                    .padding(.top)

                                let columns = [
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ]

                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(buttons, id: \.self) { buttonTitle in
                                        NavigationLink(destination: MainFeatureView(feature: buttonTitle, selectedApps: $selectedApps, availableApps: availableApps)) {
                                            ButtonView(title: buttonTitle)
                                        }
                                    }
                                }
                                .padding(.top, 20)
                            }
                        } else {
                            //currently empty.
                        }
                    }
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
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

struct MainFeatureView: View {
    var feature: String
    @Binding var selectedApps: Set<AppModel>
    var availableApps: [AppModel]

    var body: some View {
        if feature == "Create Roster" {
            CreateRosterView(selectedApps: $selectedApps, availableApps: availableApps)
        } else {
            Text("You selected \(feature)")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
        }
    }
}

// Preview for HomePage
#Preview {
    HomePage()
}
