//
//  TypeDiscoverCollectionViewCell.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class TypeDiscoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    var type: String!
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var typeImage: UIImageView!
    
    // MARK: - Function
    
    func setupCell(with type: String) {
        typeImage.layer.cornerRadius = 10
        typeImage.image = UIImage(named: type)
    }
    
}
