//
//  PokedexCollectionViewController.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class PokedexCollectionViewController: UICollectionViewController {
    // MARK: - Property
    
    private let pokedexCell = "PokedexCell"
    private var pokedex: Pokedex?
    
    // MARK: - IBOutlet
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        loadPokedex()
    }
    
    // MARK: - Private Function
    
    private func loadPokedex() {
        DispatchQueue.global(qos: .userInitiated).async {
            ApiHelper.shared.getPokedex { [unowned self] pokedex in
                self.pokedex = pokedex
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PokemonDetailViewController {
            let pokemonDetailVC = segue.destination as! PokemonDetailViewController
            let name = sender as! String
            pokemonDetailVC.name = name
        }
    }

    // MARK: - CollectionView DataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedex?.pokemon.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pokedexCell, for: indexPath) as! PokedexCollectionViewCell
        
        if let pokemon = pokedex?.pokemon[indexPath.item] {
            cell.setupCell(pokemon: pokemon)
        }
        
        return cell
    }

    // MARK: - CollectionView Delegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokedexCellSegue", sender: pokedex?.pokemon[indexPath.item].name)
    }

}

// MARK: - CollectionView Flow Layout

extension PokedexCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
