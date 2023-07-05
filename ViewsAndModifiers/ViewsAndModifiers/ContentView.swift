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
            Button("Hello World") {
                useRedBackground.toggle()
            }
            .padding()
            .foregroundColor(.white)
            .background(useRedBackground ? .red : .blue)
            
            // using the if version is less efficient because it creates 2 separate views
            // instead of just changing one modifier
            if useRedBackground {
                Button("Hello World") {
                    useRedBackground.toggle()
                }
                .padding()
                .foregroundColor(.white)
                .background(.red)
            } else {
                Button("Hello World") {
                    useRedBackground.toggle()
                }
                .padding()
                .foregroundColor(.white)
                .background(.blue)
            }
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
