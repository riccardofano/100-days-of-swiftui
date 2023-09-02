//
//  ContentView.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-02.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct ContentView: View {
    @StateObject var user = User()
    
    @State private var selectedTab = "One"
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
            
            TabView(selection: $selectedTab) {
                Text("Tab 1")
                    .onTapGesture {
                        selectedTab = "Two"
                    }
                    .tabItem {
                        Label("One", systemImage: "star")
                    }
                    .tag("One")
                Text("Tab 2")
                    .tabItem {
                        Label("Two", systemImage: "circle")
                    }
                    .tag("Two")
            }
        }
        .padding()
        .environmentObject(user)
    }
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
            .padding()
            .background(.gray)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
