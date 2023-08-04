//
//  ContentView.swift
//  Bookworm
//
//  Created by Riccardo Fano on 2023-08-03.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Push me", isOn: rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

struct PushButton: View {
    var title: String
    @State var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
