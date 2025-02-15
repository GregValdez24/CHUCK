//
//  ChuckRosterView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

struct ChuckRosterView: View {
    let activateChildMode: () -> Void
    @State private var selectedRoster: String? = nil
    let rosters = ["Roster A", "Roster B", "Roster C"]  // Example rosters for testing purposes

    var body: some View {
        VStack {
            Text("Select a Roster")
                .font(.title2)
                .fontWeight(.bold)
                .padding()

            Picker("Choose a Roster", selection: $selectedRoster) {
                ForEach(rosters, id: \.self) { roster in
                    Text(roster).tag(roster as String?)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            if selectedRoster != nil {
                Button("Set Time Restrictions") {
                    activateChildMode()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top, 20)
            }
        }
        .padding()
    }
}
