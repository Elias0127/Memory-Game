//
//  ContentView.swift
//  Memory Game
//
//  Created by Elias Woldie on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGameViewModel

    // Adjust the number of columns based on the game size
    var columns: [GridItem] {
        [GridItem](repeating: .init(.flexible()), count: viewModel.gameSize)
    }


    var body: some View {
        VStack {
            // Size choosing buttons
            HStack {
                Button("Choose Size") {
                    // Logic to show size options
                }
                .buttonStyle(OrangeButtonStyle())
                
                Button("Reset Game") {
                    viewModel.resetGame()
                }
                .buttonStyle(GreenButtonStyle())
            }

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        viewModel.chooseCard(at: card.id)
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .padding()
        }
    }
}

// Custom Button Styles
struct OrangeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct CardView: View {
    var card: MemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 3)
                    Text(card.id.description) // Replace with the card content (image or emoji)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.blue) // Card back color
                    }
                }
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
    }
}
