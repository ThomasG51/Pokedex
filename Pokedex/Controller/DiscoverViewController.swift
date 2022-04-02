//
//  ViewController.swift
//  Pokedex
//
//  Created by Thomas George on 17/03/2022.
//

import UIKit

class DiscoverViewController: UIViewController {
    // MARK: - Property
    
    var pokedex: Pokedex? = nil
    var pokemonCell = "PokemonDiscoverCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - Function
    
    
    
    // MARK: - Private Function
    
    
    
}

// MARK: - CollectionView Delegate and Datasource

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokemonCell, for: indexPath) as! PokemonDiscoverCollectionViewCell
        cell.setupCell()
        return cell
    }
    
}

// MARK: - CollectionView Flow Layout

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.layer.frame.width, height: collectionView.layer.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
