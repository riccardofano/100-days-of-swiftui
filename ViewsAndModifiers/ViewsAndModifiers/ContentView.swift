//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Riccardo Fano on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedBackground = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Gryffindor")
                    .font(.footnote)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            
            VStack {
                Text("Gryffindor")
                    // you can't undo a blur
                    // because it's not an "environmental modifier" <- not actually a real thing, just a way to think about them
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
