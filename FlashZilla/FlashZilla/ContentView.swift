//
//  ContentView.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-05.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var cards = [Card](repeating: Card.example, count: 10)

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: Card.example)
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
