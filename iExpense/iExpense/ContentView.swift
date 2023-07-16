//
//  ContentView.swift
//  iExpense
//
//  Created by Riccardo Fano on 2023-07-16.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Tap") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
