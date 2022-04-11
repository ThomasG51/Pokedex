//
//  Decode+Bundle.swift
//  Pokedex
//
//  Created by Thomas George on 11/04/2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) form bundle.")
        }
        
        return loaded
    }
}
