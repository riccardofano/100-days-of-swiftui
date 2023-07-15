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
    
    @State private var gameEnded = false
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var currentQuestion = 0
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
            
            Button("Generate questions", action: startGame)
            
            Section("Question \(currentQuestion)") {
                Text(question)
                    .font(.headline)
                
                HStack {
                    ForEach(possibleAnswers, id: \.self) { answer in
                        Button("\(answer)") {
                            chooseAnswer(answer)
                        }
                        .alert(alertTitle, isPresented: $showingAlert) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text(alertMessage)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Text("Score: \(score)")
            }
        }
        .onAppear(perform: startGame)
        .alert("Game over", isPresented: $gameEnded) {
            Button("Restart", action: startGame)
        } message: {
            Text("Your final score was \(score)/\(maxQuestions)!")
        }
    }
    
    func startGame() {
        currentQuestion = 0
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        if currentQuestion == maxQuestions {
            gameEnded = true
            return
        }
        
        currentQuestion += 1
        chosenTable = Int.random(in: 2...highestTable)
        chosenFactor = Int.random(in: 2...20)
        
        question = "What is \(chosenTable) x \(chosenFactor)?"
        let correctAnswer = chosenTable * chosenFactor
        
        possibleAnswers.removeAll(keepingCapacity: true)
        possibleAnswers.append(correctAnswer)
        possibleAnswers.append(correctAnswer + Int.random(in: 1...10))
        possibleAnswers.append(correctAnswer - Int.random(in: 1...10))
        possibleAnswers.shuffle()
    }
    
    func chooseAnswer(_ answer: Int) {
        let correctAnswer = chosenTable * chosenFactor
        if answer != correctAnswer {
            alertTitle = "Wrong"
            alertMessage = "Good guess but the answer was: \(correctAnswer)!"
        } else {
            alertTitle = "Correct"
            alertMessage = "You're a pro at this!"
            score += 1
        }
        showingAlert = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
