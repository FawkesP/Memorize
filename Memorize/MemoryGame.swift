//
//  MemoryGame.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 07/04/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {// turning the don't care type of card content into mostly don't care.
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
//The commented code below is the logic that is accomplished by the above line 15.
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
        }
        set {
            cards.indices.forEach({index in cards[index].isFaceUp = (index == newValue)})
// The lines below are replaced by the above line of code, line 25.
//          for index in cards.indices {
//              if index != newValue {// when the indexOfTheOneAndOnlyFaceUpCard is set to chosen index, this newValue will be set to chosen index as it is part of the computed variable that the value is being assigned to. This newValue is sugar provided by swift in the set method for a computed variable.
//                    cards[index].isFaceUp = false
//                }
//                else {
//                    cards[index].isFaceUp = true
//                }
//            }
        }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched { //This line checks the id of the first card and checks whether it is equal to the id of chosen card.
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    cards[chosenIndex].isFaceUp = true
                }
                else {
                    
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        //add numberOfPairsOfCards x 2 to the array
        for pairIndex in 0..<numberOfPairsOfCards {
            var content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: (pairIndex * 2) + 1))
        }
    }
    
    struct Card: Identifiable{
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent //This is a don't care/generic type.
        let id: Int //These last two are marked as constants because once set, we do not want them to be changing.
    }
}

// We can use extensions on the predefined functions like Array. Arrays called their 'don't care' to be <Elements>
// Var in extension should always be a computed var.
extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        }
        else {
            return nil
        }
    }
}
