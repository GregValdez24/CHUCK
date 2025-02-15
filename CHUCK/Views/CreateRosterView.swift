//
//  CreateRosterView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

struct CreateRosterView: View {
    @Binding var selectedApps: Set<AppModel>
    @State private var rosterName: String = ""
    @State private var rosters: [String: [AppModel]] = [:]
    var availableApps: [AppModel]
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Text("Select Apps for Your Roster")
                .font(.title2)
                .padding()

            AppSelectionView(selectedApps: $selectedApps, availableApps: availableApps)

            TextField("Roster Name", text: $rosterName)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.purple, lineWidth: 1))
                .foregroundColor(.purple)
                .padding()

            Button("Save Roster") {
                saveRoster()
            }
            .padding()
            .background(rosterName.isEmpty || selectedApps.isEmpty ? Color.gray : Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(rosterName.isEmpty || selectedApps.isEmpty)

        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Roster"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    private func saveRoster() {
        if rosters.keys.contains(rosterName) {
            alertMessage = "A roster with this name already exists."
            showAlert = true
        } else {
            rosters[rosterName] = Array(selectedApps)
            alertMessage = "Roster '\(rosterName)' saved successfully!"
            showAlert = true
            selectedApps.removeAll()
            rosterName = ""
        }
    }
}
