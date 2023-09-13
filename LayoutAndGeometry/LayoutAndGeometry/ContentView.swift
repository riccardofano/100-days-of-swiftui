//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Riccardo Fano on 2023-09-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Text("Hello world")
                .background(.green)
                .position(x: 300, y: 100)
                .background(.red)
            
            Text("Another hello")
                .background(.blue)
                .offset(x: 100, y: 100)
                .background(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
