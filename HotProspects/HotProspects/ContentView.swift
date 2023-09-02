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
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            EditView().environmentObject(user)
            DisplayView().environmentObject(user)
        }.padding()
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
