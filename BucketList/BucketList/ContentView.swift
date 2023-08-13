//
//  ContentView.swift
//  BucketList
//
//  Created by Riccardo Fano on 2023-08-13.
//

import SwiftUI

struct User: Identifiable, Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var body: some View {
        Text("Hello World")
            .onTapGesture {
                FileManager().writeToDocumentsFile(filename: "message.txt", message: "Dude where's my car?")
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
