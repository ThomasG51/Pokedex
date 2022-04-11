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
    let pokemonCell = "PokemonDiscoverCell"
    let games: [Game] = Bundle.main.decode("games.json")
    let gameCell = "GameDiscoverCell"
    
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
        gameCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pokemonCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokemonCell, for: indexPath) as! PokemonDiscoverCollectionViewCell
            cell.setupCell()
            return cell
        } else { // gameCollectionView
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCell, for: indexPath) as! GameDiscoverCollectionViewCell
            cell.setupCell(with: games[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == pokemonCollectionView {
            performSegue(withIdentifier: "PokemonDiscoverSegue", sender: nil)
        }
    }
    
}

// MARK: - CollectionView Flow Layout

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pokemonCollectionView {
            return CGSize(width: collectionView.layer.frame.width, height: collectionView.layer.frame.height)
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
            return 20
        }
    }
    
}
