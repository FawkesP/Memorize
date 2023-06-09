//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 07/04/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    //ObservableObject means that it can state everytime something changes as something changed.
    
    //Static means it is a global
    private static let emojis = ["🚅", "✈️", "🚁", "🚀", "🚂", "🏎", "🚜", "🚌", "🚗", "🚲", "🛺", "⛵️", "🚚"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    //private(set) can let other functions/classes to look into it. But they stay immutable.
    @Published private var model = createMemoryGame() //When using static function to initialize this will work. EmojiMemoryGame.createMemoryGame() is how it should be ideally defined.
    //Adding @published means that any time model is changed, it will be notified that model has changed.
    
    var cards: Array<Card> {
        model.cards
    }
    
    //Mark: - User Intent(s) (That Mark: - puts a header in the tab of this file.)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
