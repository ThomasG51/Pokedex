//
//  PokemonHomeCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class PokemonDiscoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell() {
        let randomColors = [UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor, UIColor.systemOrange.cgColor, UIColor.systemGreen.cgColor]
        pokemonImage.layer.backgroundColor = randomColors[Int.random(in: 0...3)]
    }

}
