//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Thomas George on 04/04/2022.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK: - Property
    
    var name: String!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var roundedView: UIView!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    
    @IBOutlet var sprites: [UIImageView]!
    @IBOutlet weak var spriteFrontDefault: UIImageView!
    @IBOutlet weak var spriteFrontShiny: UIImageView!
    @IBOutlet weak var spriteBackDefault: UIImageView!
    @IBOutlet weak var spriteBackShiny: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedView.layer.cornerRadius = 20
        
        loadPokemon()
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Function
    
    
    
    // MARK: - Private Function
    
    private func loadPokemon() {
        DispatchQueue.global(qos: .userInitiated).async {
            ApiHelper.shared.getPokemon(name: self.name) { [unowned self] pokemon in
                DispatchQueue.main.async {
                    self.pokemonImage.layer.backgroundColor = self.getColor(for: pokemon.types[0].category.name)
                    self.pokemonImage.load(url: URL(string: "https://img.pokemondb.net/artwork/vector/large/\(pokemon.name).png")!)
                    self.pokemonName.text = pokemon.name.capitalizingFirstLetter()
                    
                    for sprite in self.sprites {
                        sprite.layer.backgroundColor = UIColor.systemGray6.cgColor
                        sprite.layer.cornerRadius = 10
                    }
                    
                    self.spriteFrontDefault.load(url: URL(string: pokemon.sprites.frontDefault)!)
                    self.spriteBackDefault.load(url: URL(string: pokemon.sprites.backDefault)!)
                    self.spriteFrontShiny.load(url: URL(string: pokemon.sprites.frontShiny)!)
                    self.spriteBackShiny.load(url: URL(string: pokemon.sprites.backShiny)!)
                }
            }
        }
    }

    private func getColor(for type: String) -> CGColor {
        switch type {
        case "normal":
            return UIColor.systemGray.cgColor
        case "fighting":
            return UIColor.systemBrown.cgColor
        case "flying":
            return UIColor.systemTeal.cgColor
        case "poison":
            return UIColor.systemPurple.cgColor
        case "ground":
            return UIColor.systemBrown.cgColor
        case "rock":
            return UIColor.systemGray3.cgColor
        case "bug":
            return UIColor.systemGreen.cgColor
        case "ghost":
            return UIColor.systemGray2.cgColor
        case "steel":
            return UIColor.systemGray3.cgColor
        case "fire":
            return UIColor.systemOrange.cgColor
        case "water":
            return UIColor.systemBlue.cgColor
        case "grass":
            return UIColor.systemGreen.cgColor
        case "electric":
            return UIColor.systemYellow.cgColor
        case "psychic":
            return UIColor.systemIndigo.cgColor
        case "ice":
            return UIColor.systemCyan.cgColor
        case "dragon":
            return UIColor.systemMint.cgColor
        case "dark":
            return UIColor.black.cgColor
        case "fairy":
            return UIColor.systemRed.cgColor
        case "unknown":
            return UIColor.systemGray.cgColor
        case "shadow":
            return UIColor.systemGray.cgColor
        default:
            return UIColor.systemOrange.cgColor
        }
    }
    
}
