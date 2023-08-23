//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct ContentView: View {
    let pictures = [String]();
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pictures, id: \.self) { picture in
                    NavigationLink(destination: Text("Picture details view")) {
                        Text(picture)
                    }
                }
            }
            .navigationTitle("Forget me not")
            .toolbar {
                Button("New") {}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
