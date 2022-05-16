//
//  Types.swift
//  Pokedex
//
//  Created by Thomas George on 12/04/2022.
//

import Foundation

struct Types: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case damage = "damage_relations"
    }
    var name: String
    var damage: Damage
    struct Damage: Decodable {
        enum CodingKeys: String, CodingKey {
            case from = "double_damage_from"
            case to = "double_damage_to"
        }
        var from: [From]
        struct From: Decodable {
            var name: String
        }
        var to: [To]
        struct To: Decodable {
            var name: String
        }
    }
}
