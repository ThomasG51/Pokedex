//
//  Pokemon.swift
//  Pokedex
//
//  Created by Thomas George on 31/03/2022.
//

import Foundation

struct Pokedex: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "results"
    }
    
    var pokemon: [Pokemon]
    
    struct Pokemon: Decodable {
        var name: String
        var url: String
    }
    
}
