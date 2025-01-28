////
////  AppSelectionView 2.swift
////  CHUCK
////
////  Created by Greg Valdez on 1/28/25.
////
//
//import SwiftUI
//import FamilyControls
//
//struct AppSelectionView: View {
//    @State private var selection = FamilyActivitySelection()
//    @Binding var selectedApps: Set<AppModel>
//    var body: some View {
//        VStack {
//            FamilyActivityPicker(selection: $selection)
//                .onChange(of: selection) { oldSelection, newSelection in
//                    saveSelectedApps(newSelection)
//                }
//            
//            Text("Selected Apps: \(selection.applications.count) apps selected")
//                .padding()
//        }
//        .padding()
//    }
//
//    func saveSelectedApps(_ selection: FamilyActivitySelection) {
//        for app in selection.applications {
//            print("App: \(app)") 
//        }
//    }
//
//}

import SwiftUI
import FamilyControls

struct AppSelectionView: View {
    @State private var selection = FamilyActivitySelection()
    @Binding var selectedApps: Set<AppModel>
    
    // List of available apps to choose from
    var availableApps: [AppModel]  // You will need to pass this data into the view

    var body: some View {
        VStack {
            // Display available apps for selection (you can adjust this as needed)
            FamilyActivityPicker(selection: $selection)
                .onChange(of: selection) { oldSelection, newSelection in
                    saveSelectedApps(newSelection)
                }
            
            Text("Selected Apps: \(selection.applications.count) apps selected")
                .padding()

            // Optionally show the available apps here
            List(availableApps, id: \.id) { app in
                Text(app.name)
            }
        }
        .padding()
    }

    func saveSelectedApps(_ selection: FamilyActivitySelection) {
        // Process the selected apps and update the binding
        for app in selection.applications {
            // Print out the app to inspect its properties
            print(app)
            
            //need to debug this 
        }
    }

}

