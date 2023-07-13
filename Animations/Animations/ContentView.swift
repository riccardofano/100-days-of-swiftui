//
//  ContentView.swift
//  Animations
//
//  Created by Riccardo Fano on 2023-07-12.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = true;
    
    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 100, height: 100)
        .foregroundColor(.white)
        .background(enabled ? .red : .blue)
        .animation(nil, value: enabled)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 50 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
