//
//  GameDiscoverCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class GameDiscoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var game: Game!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var gameImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell(with game: Game) {
        gameImage.layer.cornerRadius = 10
        gameImage.image = UIImage(named: game.version)
    }
    
}
