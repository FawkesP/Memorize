//
//  ContentView.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚅", "✈️", "🚁", "🚀", "🚂", "🏎", "🚜", "🚌", "🚗", "🚲", "🛺", "⛵️", "🚚"]
    
    @State var emojiCount = 6
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(emojis[0..<emojiCount], id:\.self){emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
        var remove: some View{
            Button(action: {
                if emojiCount > 1{
                    emojiCount -= 1
                }
            }, label:{
                Image(systemName: "minus.circle")
            })
        }
        var add: some View{
            Button(action: {
                if emojiCount < emojis.count {
                    emojiCount += 1
                }
            }, label:{
                Image(systemName: "plus.circle")
            })
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
        
}

//Creating a function for card view
struct CardView: View{
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack(content: {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape
                    .fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                    
                Text(content).font(.largeTitle)
               
            }
            else{
                shape
                    .fill()
            }
        })
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}
