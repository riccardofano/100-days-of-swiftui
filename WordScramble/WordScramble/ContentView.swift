//
//  ContentView.swift
//  WordScramble
//
//  Created by Riccardo Fano on 2023-07-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                Section("First Section") {
                    Text("static row")
                    ForEach(0..<5) {
                        Text("Row \($0 + 1)")
                    }
                }
                
                Section("Second Section") {
                    Text("static row")
                    Text("static row")
                }
            }.listStyle(.sidebar)
            
            List(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
