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
        
        loadPokedex()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
            cell.setupCell(pokemon: pokemon, number: indexPath.item + 1)
        }
        
        return cell
    }

    // MARK: - CollectionView Delegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokedexCellSegue", sender: nil)
    }

}

// MARK: - CollectionView Flow Layout

extension PokedexCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
