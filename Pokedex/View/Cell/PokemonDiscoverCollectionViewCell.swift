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
    
    @IBOutlet weak var radialGradient: GradientView!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell(with pokemon: Pokedex.Pokemon) {
        ApiHelper.shared.getPokemon(name: pokemon.name) { pokemon in
            DispatchQueue.main.async { [unowned self] in
                if let url = URL(string: "https://img.pokemondb.net/artwork/vector/large/\(pokemon.name).png") {
                    pokemonImage.load(url: url)
                }
                self.setupeGradient(for: pokemon.types[0].category.name)
            }
        }
    }

    
    private func setupeGradient(for type: String) {
        switch type {
        case "normal":
            radialGradient.sideColor = UIColor(named: "normal dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "normal light") ?? .white
        case "fighting":
            radialGradient.sideColor = UIColor(named: "fighting dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "fighting light") ?? .white
        case "flying":
            radialGradient.sideColor = UIColor(named: "flying dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "flying light") ?? .white
        case "poison":
            radialGradient.sideColor = UIColor(named: "poison dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "poison light") ?? .white
        case "ground":
            radialGradient.sideColor = UIColor(named: "ground dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "ground light") ?? .white
        case "rock":
            radialGradient.sideColor = UIColor(named: "rock dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "rock light") ?? .white
        case "bug":
            radialGradient.sideColor = UIColor(named: "bug dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "bug light") ?? .white
        case "ghost":
            radialGradient.sideColor = UIColor(named: "ghost dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "ghost light") ?? .white
        case "steel":
            radialGradient.sideColor = UIColor(named: "steel dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "steel light") ?? .white
        case "fire":
            radialGradient.sideColor = UIColor(named: "fire dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "fire light") ?? .white
        case "water":
            radialGradient.sideColor = UIColor(named: "water dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "water light") ?? .white
        case "grass":
            radialGradient.sideColor = UIColor(named: "grass dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "grass light") ?? .white
        case "electric":
            radialGradient.sideColor = UIColor(named: "electric dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "electric light") ?? .white
        case "psychic":
            radialGradient.sideColor = UIColor(named: "psychic dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "psychic light") ?? .white
        case "ice":
            radialGradient.sideColor = UIColor(named: "ice dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "ice light") ?? .white
        case "dragon":
            radialGradient.sideColor = UIColor(named: "dragon dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "dragon light") ?? .white
        case "dark":
            radialGradient.sideColor = UIColor(named: "dark dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "dark light") ?? .white
        case "fairy":
            radialGradient.sideColor = UIColor(named: "fairy dark") ?? .systemGray
            radialGradient.centerColor = UIColor(named: "fairy light") ?? .white
        default:
            radialGradient.sideColor = .systemGray
            radialGradient.centerColor = .white
        }
    }
}
