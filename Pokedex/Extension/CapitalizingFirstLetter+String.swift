//
//  CapitalizingFirstLetter.swift
//  Pokedex
//
//  Created by Thomas George on 05/04/2022.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
