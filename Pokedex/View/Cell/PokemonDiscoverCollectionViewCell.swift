//
//  PokemonHomeCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class PokemonDiscoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var pokemon: Pokedex.Pokemon!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell(with pokemon: Pokedex.Pokemon) {
        if let url = URL(string: "https://img.pokemondb.net/artwork/vector/large/\(pokemon.name).png") {
            pokemonImage.load(url: url)
        }
    }

}
