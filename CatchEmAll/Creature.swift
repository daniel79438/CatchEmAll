//
//  Creature.swift
//  CatchEmAll
//
//  Created by Daniel Harris on 27/03/2025.
//

import Foundation

struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var url: String // url for detail on Pokemon
    
    enum CodingKeys: String, CodingKey { // ignore the ID property when decoding
        case id
        case name
        case url
    }
}
