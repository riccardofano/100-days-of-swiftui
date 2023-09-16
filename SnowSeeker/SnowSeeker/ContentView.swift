//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Riccardo Fano on 2023-09-16.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var user: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Text("Hello world")
            .onTapGesture {
                user = User()
                isShowingUser = true
            }
            .sheet(item: $user) { user in
                Text(user.id)
            }
            .alert("Welcome", isPresented: $isShowingUser, presenting: user) { user in
                Button(user.id) { }
            }
            // Same result as having a Button("OK") inside the alert body
            .alert("Default alert", isPresented: $isShowingUser) { }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
