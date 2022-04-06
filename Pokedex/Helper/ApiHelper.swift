//
//  ApiHelper.swift
//  Pokedex
//
//  Created by Thomas George on 31/03/2022.
//

import Foundation
import UIKit

class ApiHelper {
    
    // MARK: - PROPERTY
    
    static let shared = ApiHelper()
    
    // MARK: - FUNCTION
    
    func getPokedex(completion: @escaping(Pokedex) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-form?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let pokedex = try JSONDecoder().decode(Pokedex.self, from: data)
                
                completion(pokedex)
            } catch {
                print("Decode error: " + error.localizedDescription)
            }
        }.resume()
    }
    
    func getPokemon(name: String, completion: @escaping(Pokemon) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-form/\(name)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                
                completion(pokemon)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
