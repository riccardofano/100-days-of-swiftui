//
//  ContentView.swift
//  Edutainment
//
//  Created by Riccardo Fano on 2023-07-15.
//

import SwiftUI

struct ContentView: View {
    @State private var highestTable = 10
    
    let difficulties = [5, 10, 20]
    @State private var maxQuestions = 5
    
    @State private var question = ""
    @State private var chosenTable: Int = 2
    @State private var chosenFactor: Int = 5
    @State private var possibleAnswers: [Int] = []
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var currentQuestion = 1
    @State private var score = 0
    
    var body: some View {
        Form {
            Stepper(
                "Highest table: \(highestTable.formatted())",
                value: $highestTable,
                in: 2...12, step: 1
            )
            
            Picker("Number of questions",selection: $maxQuestions) {
                ForEach(difficulties, id: \.self) {
                    Text("\($0) questions")
                }
            }
            .pickerStyle(.wheel)
            .frame(maxHeight: 120)
            
            Button("Generate questions", action: askQuestion)
            
        }.onAppear(perform: askQuestion)
    }
    
    func askQuestion() {
    }
    
    func chooseAnswer(_ answer: Int) {
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
