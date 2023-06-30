//
//  ContentView.swift
//  WeSplit
//
//  Created by Riccardo Fano on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    // Mutating a value inside a computed variable in a struct is not allowed
    // @State allows that value to be stored separately by SwiftUI in a place that can be modified
    // From the wording in the article it seems SwiftUI is creating a new struct every time a property changes kinda like in React where the whole component reruns every time
    // adding private is recommened with @State properties because they should only be accessed inside the same struct
    @State private var tapCount = 0
    
    var body: some View {
        NavigationView {
            Form {
                // You can only have 10 sibling elements
                // so if you want to have more than that you can group them
                Section {
                    Text("Hello world")
                }
                Section {
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                    Text("Hello world")
                }
                // you specify the onClick event as a trailing closure
                Button("This button has been pressed \(tapCount) times.") {
                    tapCount += 1
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
