//
//  GameTableViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    // MARK: - Property
    
    @IBOutlet weak var gameImage: UIImageView!
    
    // MARK: - Function
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    func setupCell() {
        gameImage.layer.backgroundColor = UIColor.systemCyan.cgColor
        gameImage.layer.cornerRadius = 10
    }

}
