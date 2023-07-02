//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Riccardo Fano on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 50) {
            Button("Show alert") {
                showingAlert = true
            }.alert("I'm an alert", isPresented: $showingAlert) {
                Button("Ok") {}
            } message: {
                Text("I know you're not going to read this")
            }
            Button {
               print("You fool!")
            } label: {
                Label("Don't press this", systemImage: "xmark.circle.fill")
            }
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(.infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
