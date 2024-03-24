//
//  Memory_GameApp.swift
//  Memory Game
//
//  Created by Elias Woldie on 3/22/24.
//

import SwiftUI

@main
struct Memory_GameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MemoryGameViewModel())
        }
    }
}
