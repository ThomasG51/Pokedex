//
//  GameTableViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    // MARK: - Property
    
    var game: Game!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameConsole: UILabel!
    @IBOutlet weak var gameYear: UILabel!
    
    // MARK: - Function
    
    func setupCell(with game: Game) {
        gameImage.image = UIImage(named: game.version)
        gameImage.layer.cornerRadius = 10
        gameTitle.text = game.title
        gameConsole.text = game.console
        gameYear.text = String(game.year)
    }

}
