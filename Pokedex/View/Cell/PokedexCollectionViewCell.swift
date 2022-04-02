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
    
    func setupCell() {
        pokemonImage.layer.backgroundColor = UIColor.systemGray.cgColor
        pokemonImage.layer.cornerRadius = 10
        
        pokemonName.text = "Pokemon Name"
    }
    
}
