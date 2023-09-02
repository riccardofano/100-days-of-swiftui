//
//  ContentView.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-02.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button {
                        backgroundColor = .green
                    } label: {
                        Label("Green", systemImage: "star.fill")
                        // The foreground color will be black anyway
                            .foregroundColor(.green)
                    }
                    
                    // iOS changes the button color based on the role instead
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }

                    Button {
                        backgroundColor = .blue
                    } label: {
                        Label("Blue", systemImage: "square.fill")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
