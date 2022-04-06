//
//  Pokdemon.swift
//  Pokedex
//
//  Created by Thomas George on 05/04/2022.
//

import Foundation

struct Pokemon: Decodable {
    
    var name: String
    var order: Int
    
    var sprites: Sprites
    struct Sprites: Decodable {
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case backDefault = "back_default"
            case backShiny =  "back_shiny"
        }
        var frontDefault: String
        var frontShiny: String
        var backDefault: String
        var backShiny: String
    }
    
    var types : [Types]
    struct Types: Decodable {
        enum CodingKeys: String, CodingKey {
            case name = "type"
        }
        var name: Name
        struct Name: Decodable {
            var name: String
        }
    }
    
}
