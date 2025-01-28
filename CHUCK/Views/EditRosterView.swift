//
//  EditRosterView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//
import SwiftUI
import FamilyControls

struct EditRosterView: View {
    @AppStorage("savedRosters") private var savedRostersData: Data = Data()
    @State private var savedRosters: [Roster] = []
    @State private var selectedRoster: Roster? = nil
    @State private var isEditing: Bool = false
    @State private var selection = FamilyActivitySelection()

    var availableApps: [AppModel]  // Pass this data into the view

    var body: some View {
        VStack {
            Text("Edit Your Roster")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            // List of saved rosters
            List(savedRosters, id: \.id) { roster in
                Button(action: {
                    selectedRoster = roster
                    isEditing = true
                }) {
                    Text(roster.name)
                }
            }

            if isEditing, let selectedRoster = selectedRoster {
                VStack {
                    Text("Editing Roster: \(selectedRoster.name)")
                        .font(.title2)
                        .padding()

                    Text("Apps in this Roster:")
                        .font(.headline)
                    List(Array(selectedRoster.apps), id: \.self) { app in
                        HStack {
                            Text(app.name)
                            Spacer()
                            Button(action: {
                                removeAppFromRoster(app)
                            }) {
                                Text("Remove")
                                    .foregroundColor(.red)
                            }
                        }
                    }

                    Text("Available Apps:")
                        .font(.headline)
                    List(availableApps, id: \.self) { app in
                        Button(action: {
                            addAppToRoster(app)
                        }) {
                            Text("Add \(app.name)")
                        }
                    }

                    Button("Save Changes") {
                        saveRosterChanges()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .onAppear {
            loadSavedRosters()
        }
    }

    private func loadSavedRosters() {
        if let rosters = try? JSONDecoder().decode([Roster].self, from: savedRostersData) {
            savedRosters = rosters
        }
    }

    // Add an app to the selected roster
    private func addAppToRoster(_ app: AppModel) {
        guard var selectedRoster = selectedRoster else { return }
        selectedRoster.apps.insert(app)
        self.selectedRoster = selectedRoster
    }

    // Remove an app from the selected roster
    private func removeAppFromRoster(_ app: AppModel) {
        guard var selectedRoster = selectedRoster else { return }
        selectedRoster.apps.remove(app)
        self.selectedRoster = selectedRoster
    }

    // Save the modified roster
    private func saveRosterChanges() {
        guard let selectedRoster = selectedRoster else { return }

        if let index = savedRosters.firstIndex(where: { $0.id == selectedRoster.id }) {
            savedRosters[index] = selectedRoster
            if let data = try? JSONEncoder().encode(savedRosters) {
                savedRostersData = data
            }
        }

        isEditing = false
    }
}
