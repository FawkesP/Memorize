//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 05/04/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //ObservedObject means that it will remake the view when it gets notification of change.
    @ObservedObject var game: EmojiMemoryGame //viewModel is here for us to understand, ideally it could be called something like Game.
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                ForEach(game.cards){card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
    }
}

//Creating a function for card view
struct CardView: View{
    let card: EmojiMemoryGame.Card

    var body: some View{
        GeometryReader { geometry in
            ZStack(content: {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    shape
                        .fill().foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: DrawingConstants.lineWidth)
                        
                    Text(card.content).font(fontInset(in: geometry.size))
                   
                }
                else if card.isMatched {
                    shape.opacity(0)
                    // so that the card stay in place but are invisible. According to logic, they are not clickable once matched, so that plays a part by not making them clickable and hence safe to hide like this.
                }
                else {
                    shape
                        .fill()
                }
            })
        }
    }
}

//The private function below is created to make the Text readable. The return of the function was part of the function .font() for Text
private func fontInset(in size: CGSize) -> Font {
    Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
}

private struct DrawingConstants {
    static let cornerRadius: CGFloat = 20
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.8
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
    }
        
}
