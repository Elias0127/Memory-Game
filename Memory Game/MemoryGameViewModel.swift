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
    
    func resetGame() {
        model.resetGame()
    }
}
