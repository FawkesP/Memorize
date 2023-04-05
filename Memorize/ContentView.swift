//
//  ContentView.swift
//  Memorize
//
//  Created by Pranav A Patwardhan on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3.0)
                .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        })
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
