//
//  ContentView.swift
//  Moonshot
//
//  Created by Riccardo Fano on 2023-07-19.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Hello \($0)")
                }
            }
        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) {
                    Text("Hello \($0)")
                }
            }
        }
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
