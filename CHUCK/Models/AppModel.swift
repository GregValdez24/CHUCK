//
//  AppModel.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import SwiftUI

// Model for an App
struct AppModel: Identifiable, Hashable, Decodable, Encodable {
    var id: UUID  // Change from 'let' to 'var'
    let name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }

    static func == (lhs: AppModel, rhs: AppModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
