//
//  Roster.swift
//  CHUCK
//
//  Created by Greg Valdez on 1/28/25.
//

import Foundation

struct Roster: Identifiable, Codable {
    var id: String
    var name: String
    var apps: Set<AppModel>
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case apps
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        let appsArray = try container.decode([AppModel].self, forKey: .apps)
        apps = Set(appsArray)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(Array(apps), forKey: .apps)
    }
}
