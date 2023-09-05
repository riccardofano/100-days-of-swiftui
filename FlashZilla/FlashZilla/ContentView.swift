//
//  ContentView.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Tap")
                .onTapGesture {
                    print("Tapped the button")
                }
            Text("Double tap")
                .onTapGesture(count: 2) {
                    print("Tapped the button twice")
                }
            Text("Long press")
                .onLongPressGesture {
                    print("Long pressed the button")
                }
            Text("Long long press")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long pressed for at least 2 seconds")
                } onPressingChanged: { inProgress in
                    print("Is in progress: \(inProgress)")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
