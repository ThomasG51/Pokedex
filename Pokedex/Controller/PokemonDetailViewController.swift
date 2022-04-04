//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Thomas George on 04/04/2022.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var roundedView: UIView!
    
    
    // MARK: - IBOutlet
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonImage.layer.backgroundColor = UIColor.systemOrange.cgColor
        roundedView.layer.cornerRadius = 20
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Function
    
    
    
    // MARK: - Private Function
    
    

}
