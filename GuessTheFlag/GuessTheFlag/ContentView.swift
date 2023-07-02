//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Riccardo Fano on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
    // having 2 children as the top level elements of the body creates 2 screens
    var body: some View {
        // this in css would be
        // flex coloumn
        VStack(alignment: .leading, spacing: 50) {
            Text("Hello longer thing")
            Text("World")
        }.background(.red)
        // flex row
        HStack(spacing: 20) {
            Text("Hello, world!")
            Text("This is inside a stack")
        }
        // position absolute
        // or grid in the same cell
        ZStack() {
            // Color.red.frame(width: 200, height: 100)
            Color.red
            Text("Hello, world!")
            Text("This is inside a stack")
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
