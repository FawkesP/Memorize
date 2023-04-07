//
//  ContentView.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    //ObservedObject means that it will remake the view when it gets notification of change.
    @ObservedObject var viewModel: EmojiMemoryGame //viewModel is here for us to understand, ideally it could be called something like Game.
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                ForEach(viewModel.cards){card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
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
    let card: MemoryGame<String>.Card
    var body: some View{
        ZStack(content: {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape
                    .fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                    
                Text(card.content).font(.largeTitle)
               
            }
            else{
                shape
                    .fill()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
        
}
