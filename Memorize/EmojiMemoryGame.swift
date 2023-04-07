//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 07/04/2023.
//

import SwiftUI

class EmojiMemoryGame{
    
    //Static means it is a global
    static let emojis = ["🚅", "✈️", "🚁", "🚀", "🚂", "🏎", "🚜", "🚌", "🚗", "🚲", "🛺", "⛵️", "🚚"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    //private(set) can let other functions/classes to look into it. But they stay immutable.
    private var model: MemoryGame<String> = createMemoryGame() //When using static function to initialize this will work. EmojiMemoryGame.createMemoryGame() is how it should be ideally defined.
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
