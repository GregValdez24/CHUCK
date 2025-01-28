//
//  RoleSelectionView.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

struct RoleSelectionView: View {
    @AppStorage("userRole") private var userRole: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Select Your Mode")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Button("Editing") {
                userRole = "parent"
                dismiss()
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Locking In") {
                userRole = "child"
                dismiss()
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
