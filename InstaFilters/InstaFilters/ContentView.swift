//
//  ContentView.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-10.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("Amount changed, now it's \(blurAmount)")
        }
    }

    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) {
                    print("Slider changed blurAmount, it's now \($0)")
                }

            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
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
