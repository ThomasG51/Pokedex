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
    
    func setupCell(pokemon: Pokedex.Pokemon, number: Int) {
        if let url = URL(string: "https://img.pokemondb.net/artwork/large/\(pokemon.name).jpg") {
            pokemonImage.load(url: url)
        }
        
        pokemonName.text = pokemon.name
    }
    
}
