//
//  GamesTableViewController.swift
//  Pokedex
//
//  Created by Thomas George on 02/04/2022.
//

import UIKit

class GamesTableViewController: UITableViewController {

    // MARK: - Property
    
    let gameCell = "GameCell"
    let games: [Game] = Bundle.main.decode("games.json")
    
    // MARK: - IBOutlet
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    
    
    // MARK: - TableView Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: gameCell, for: indexPath) as! GameTableViewCell
        cell.setupCell(with: games[indexPath.row])

        return cell
    }

}
