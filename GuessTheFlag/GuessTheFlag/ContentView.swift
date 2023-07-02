//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Riccardo Fano on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
    // having 2 children as the top level elements of the body creates 2 screens
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(gradient: Gradient(colors: [.blue, .black.opacity(0.1)]), center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center).opacity(0.5)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
