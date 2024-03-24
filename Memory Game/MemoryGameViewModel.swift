//
//  MemoryGameViewModel.swift
//  Memory Game
//
//  Created by Elias Woldie on 3/22/24.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published var model: MemoryGame
    @Published var gameSize: Int = 4 // Default value
    let possibleSizes: [Int] = [3, 6, 10]
    
    init() {
        model = MemoryGame(numberOfPairsOfCards: 8)
    }
    
    // Access to the Model
    var cards: [MemoryGame.Card] {
        model.cards
    }
    
    func chooseCard(at index: Int) {
        model.chooseCard(at: index)
    }
    
    func changeGameSize(to newSize: Int) {
            // Create a new game with the specified number of pairs
            model = MemoryGame(numberOfPairsOfCards: newSize)
        }
    
    func resetGame() {
        model.resetGame()
    }
}
