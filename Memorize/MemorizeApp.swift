//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 05/04/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()//game is a pointer to the class. So what pointer points to can be changed but pointer shouldn't be.
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
