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

    var body: some View {
        VStack {
            Text("Select Apps for Your Roster")
                .font(.title2)
                .padding()

            AppSelectionView(selectedApps: $selectedApps, availableApps: availableApps)

            TextField("", text: $rosterName)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.purple, lineWidth: 1))
                .overlay(
                    Group {
                        if rosterName.isEmpty {
                            Text("Roster Name")
                                .foregroundColor(.purple.opacity(0.5))
                                .padding(.leading, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                )
                .foregroundColor(.purple)
                .padding()
            
            Button("Save Roster") {
                if !rosterName.isEmpty {
                    rosters[rosterName] = Array(selectedApps)
                    print("Roster saved: \(rosterName) with apps: \(selectedApps.map { $0.name })")
                }
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(8)
            .disabled(rosterName.isEmpty || selectedApps.isEmpty)
        }
        .padding()
    }
}
