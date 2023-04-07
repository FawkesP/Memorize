//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 07/04/2023.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card> ()
        //add numberOfPairsOfCards x 2 to the array
        for pairIndex in 0..<numberOfPairsOfCards {
            var content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: (pairIndex * 2) + 1))
        }
    }
    
    struct Card: Identifiable{
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //This is a don't care/generic type.
        var id: Int
    }
}
