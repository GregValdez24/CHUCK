//
//  AppSelectionView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI
import FamilyControls

struct AppSelectionView: View {
    @State private var selection = FamilyActivitySelection()
    @Binding var selectedApps: Set<AppModel>

    var availableApps: [AppModel]

    var body: some View {
        VStack {
            GeometryReader { geometry in
                FamilyActivityPicker(selection: $selection)
                    .frame(height: max(geometry.size.height, 400))
                    .onChange(of: selection) { _, newSelection in
                        print("Picker Selection Changed!")
                        print("New Selection Count: \(newSelection.applications.count)")
                        for app in newSelection.applications {
                            print("Selected App: \(app.localizedDisplayName ?? "Unknown App") - Bundle ID: \(app.bundleIdentifier ?? "No Bundle ID")")
                        }
                        DispatchQueue.main.async {
                            saveSelectedApps(newSelection)
                        }
                    }
            }
            .frame(height: 400)
            
            Text("Picker Selection Count: \(selection.applications.count)")
                .padding()
                .onAppear {
                    print("Initial Picker Selection Count: \(selection.applications.count)")
                }

//            Text("Selected Apps: \(selectedApps.count) apps selected")
//                .padding()

            List(Array(selectedApps), id: \.id) { app in
                Text(app.name)
            }
        }
        .padding()
    }

    private func saveSelectedApps(_ selection: FamilyActivitySelection) {
        var newApps: Set<AppModel> = []

        for app in selection.applications {
            if let bundleID = app.bundleIdentifier {
                let appModel = AppModel(id: bundleID, name: app.localizedDisplayName ?? "Unknown App")
                newApps.insert(appModel)
            }
        }

        DispatchQueue.main.async {
            self.selectedApps = newApps
        }
    }
}
