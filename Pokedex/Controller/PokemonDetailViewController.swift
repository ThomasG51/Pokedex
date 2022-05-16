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
    @IBOutlet weak var radialGradient: GradientView!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet var sprites: [UIImageView]!
    @IBOutlet weak var spriteFrontDefault: UIImageView!
    @IBOutlet weak var spriteFrontShiny: UIImageView!
    @IBOutlet weak var spriteBackDefault: UIImageView!
    @IBOutlet weak var spriteBackShiny: UIImageView!
    
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var typeName: UILabel!
    
    @IBOutlet weak var fromTypeGroup: UIStackView!
    @IBOutlet weak var firstFromTypeImage: UIImageView!
    @IBOutlet weak var secondFromTypeImage: UIImageView!
    @IBOutlet weak var thirdFromTypeImage: UIImageView!
    
    @IBOutlet weak var toTypeGroup: UIStackView!
    @IBOutlet weak var firstToTypeImage: UIImageView!
    @IBOutlet weak var secondToTypeImage: UIImageView!
    @IBOutlet weak var thirdToTypeImage: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedView.layer.cornerRadius = 20
        fromTypeGroup.layer.cornerRadius = 10
        fromTypeGroup.layer.backgroundColor = UIColor.systemGray6.cgColor
        toTypeGroup.layer.cornerRadius = 10
        toTypeGroup.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        loadPokemon()
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Function
    
    
    
    // MARK: - Private Function
    
    private func loadPokemon() {
        ApiHelper.shared.getPokemon(name: self.name) { [unowned self] pokemon in
            loadTypes(for: pokemon)
            
            DispatchQueue.main.async {
                self.setupeGradient(for: pokemon.types[0].category.name)
                
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
    
    private func loadTypes(for pokemon: Pokemon) {
        ApiHelper.shared.getTypes(by: pokemon.types[0].category.name) { types in
            DispatchQueue.main.async {
                self.typeImage.image = UIImage(named: types.name)
                self.typeName.text = types.name
                
                if types.damage.from.count >= 1 {
                    self.firstFromTypeImage.image = UIImage(named: types.damage.from[0].name)
                }
                
                if types.damage.from.count >= 2 {
                    self.secondFromTypeImage.image = UIImage(named: types.damage.from[1].name)
                }
                    
                if types.damage.from.count >= 3 {
                    self.thirdFromTypeImage.image = UIImage(named: types.damage.from[2].name)
                }
                
                if types.damage.to.count >= 1 {
                    self.firstToTypeImage.image = UIImage(named: types.damage.to[0].name)
                }
                
                if types.damage.to.count >= 2 {
                    self.secondToTypeImage.image = UIImage(named: types.damage.to[1].name)
                }
                    
                if types.damage.to.count >= 3 {
                    self.thirdToTypeImage.image = UIImage(named: types.damage.to[2].name)
                }
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
