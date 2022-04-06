//
//  PokedexCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    // MARK: - Function
    
    func setupCell(pokemon: Pokedex.Pokemon) {
        if let url = URL(string: "https://img.pokemondb.net/artwork/vector/large/\(pokemon.name).png") {
            pokemonImage.load(url: url)
        }
        
        pokemonName.text = pokemon.name
    }
    
}
