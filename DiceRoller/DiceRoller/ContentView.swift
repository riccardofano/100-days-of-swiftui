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
    @State private var rollResults = [Int]()
    
    let timerTicks = 10
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var ticksRemaining: Int? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Number of faces:", selection: $selectedDie) {
                    ForEach(dieFaces, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Button("Roll") {
                    self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                    self.ticksRemaining = 10
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
                        .padding(.vertical, 30)
                    Spacer()
                }
                .listRowBackground(Color.white.opacity(0))
                
                if (rollResults.count > 0) {
                    Section("Previous results") {
                        ForEach(0..<rollResults.count, id: \.self) { index in
                            Text("\(rollResults[index])")
                        }
                    }
                }
                
            }
            .onReceive(timer) { time in
                guard let ticks = ticksRemaining else {
                    return
                }
                
                if ticks > 0 {
                    self.ticksRemaining = ticks - 1
                    randomedValue = Int.random(in: 1...selectedDie)
                } else {
                    timer.upstream.connect().cancel()
                    rollResults.append(randomedValue)
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
