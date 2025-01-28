//
//  AppSelectionView 2.swift
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
            FamilyActivityPicker(selection: $selection)
                .onChange(of: selection) { oldSelection, newSelection in
                    saveSelectedApps(newSelection)
                }
            
            Text("Selected Apps: \(selection.applications.count) apps selected")
                .padding()

            List(availableApps, id: \.id) { app in
                Text(app.name)
            }
        }
        .padding()
    }

    func saveSelectedApps(_ selection: FamilyActivitySelection) {
        for app in selection.applications {
            print(app)
            
            //need to debug this 
        }
    }

}

