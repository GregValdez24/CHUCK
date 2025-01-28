//
//  Roster.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import Foundation

// Assuming AppModel is already conforming to Decodable
struct Roster: Identifiable, Codable {
    var id: String
    var name: String
    var apps: Set<AppModel>  // Set of AppModels
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case apps
    }
    
    // Custom initializer for Decodable
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        // Decode 'apps' as an array first and convert it to Set
        let appsArray = try container.decode([AppModel].self, forKey: .apps)
        apps = Set(appsArray)
    }
    
    // Encode function if you need to store or send this model
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(Array(apps), forKey: .apps)  // Encode as an array
    }
}
