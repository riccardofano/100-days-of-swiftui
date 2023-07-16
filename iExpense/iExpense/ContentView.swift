//
//  ContentView.swift
//  iExpense
//
//  Created by Riccardo Fano on 2023-07-16.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @AppStorage("Tap") private var tapCount = 0
    @State private var user = User(firstName: "Bobby", lastName: "Smith")

    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
            Button("Save user") {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "User")
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
