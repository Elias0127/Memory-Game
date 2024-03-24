//
//  MemoryGame.swift
//  Memory Game
//
//  Created by Elias Woldie on 3/22/24.
//

struct MemoryGame {
    var cards: [Card]
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = cards.firstIndex(where: { $0.isFaceUp && !$0.isMatched }),
                matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                cards[index].isFaceUp = true
            }
        }
    }
    
    mutating func resetGame() {
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }
    
    init(numberOfPairsOfCards: Int) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let card = Card(id: pairIndex)
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
    }
}
