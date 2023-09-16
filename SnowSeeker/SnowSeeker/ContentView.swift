//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Riccardo Fano on 2023-09-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
//                .navigationBarHidden(true)
            
            Text("Third view")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
