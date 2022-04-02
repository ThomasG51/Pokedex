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
    var gameCell = "GameDiscoverCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
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
        if collectionView == pokemonCollectionView {
            return 4
        } else { // gameCollectionView
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pokemonCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokemonCell, for: indexPath) as! PokemonDiscoverCollectionViewCell
            cell.setupCell()
            return cell
        } else { // gameCollectionView
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCell, for: indexPath) as! GameDiscoverCollectionViewCell
            cell.setupCell()
            return cell
        }
    }
    
}

// MARK: - CollectionView Flow Layout

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pokemonCollectionView {
            return CGSize(width: collectionView.layer.frame.width, height: collectionView.layer.frame.width)
        } else { // gameCollectionView
            return CGSize(width: 140, height: 140)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == pokemonCollectionView {
            return 0
        } else { // gameCollectionView
            return 10
        }
    }
    
}
