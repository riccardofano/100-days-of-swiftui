//
//  ContentView.swift
//  WeSplit
//
//  Created by Riccardo Fano on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            // You can only have 10 sibling elements
            // so if you want to have more than that you can group them
            Group {
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
            }
            Group {
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
                Text("Hello world")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
