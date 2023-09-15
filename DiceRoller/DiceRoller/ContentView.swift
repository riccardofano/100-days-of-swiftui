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
    
    @State private var randomedValue = 6
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Number of faces:", selection: $selectedDie) {
                    ForEach(dieFaces, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Button("Roll") {
                    randomedValue = Int.random(in: 1..<selectedDie+1)
                }
                
                HStack {
                    Spacer()
                    
                    Text("\(randomedValue)")
                        .font(.largeTitle.bold())
                        .frame(width: 100, height: 100)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black, lineWidth: 5)
                        )
                        .padding(.top, 30)
                    Spacer()
                }
                .listRowBackground(Color.white.opacity(0))
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
