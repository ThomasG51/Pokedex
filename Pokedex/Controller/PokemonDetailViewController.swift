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
        pokemonImage.layer.backgroundColor = UIColor.systemOrange.cgColor
        
        loadPokemon()
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Function
    
    
    
    // MARK: - Private Function
    
    private func loadPokemon() {
        DispatchQueue.global(qos: .userInitiated).async {
            ApiHelper.shared.getPokemon(name: self.name) { [unowned self] pokemon in
                DispatchQueue.main.async {
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

}
