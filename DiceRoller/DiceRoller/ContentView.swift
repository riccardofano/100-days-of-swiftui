//
//  ContentView.swift
//  DiceRoller
//
//  Created by Riccardo Fano on 2023-09-15.
//

import SwiftUI

struct ContentView: View {
    let dieFaces = [4, 6, 8, 10, 12, 20, 100]
    @State private var selectedDie = 6
    
    var body: some View {
        NavigationView {
            Form {
                Section("Number of faces") {
                    Picker("", selection: $selectedDie) {
                        ForEach(dieFaces, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Dice roller")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
