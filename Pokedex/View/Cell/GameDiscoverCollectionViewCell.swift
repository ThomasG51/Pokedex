//
//  GameDiscoverCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class GameDiscoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var gameImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell() {
        gameImage.layer.backgroundColor = UIColor.systemMint.cgColor
        gameImage.layer.cornerRadius = 10
    }
    
}
