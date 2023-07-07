//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Riccardo Fano on 2023-07-07.
//

import SwiftUI

enum MatchResult: CustomStringConvertible {
    case Win, Loss
    
    var description: String {
        switch self {
        case .Win:
            return "Win"
        case .Loss:
            return "Loss"
        }
    }
}

enum Move: CustomStringConvertible {
    case Rock, Paper, Scissors
    
    func correctMove(toAchieve: MatchResult) -> Self {
        switch (self, toAchieve) {
        case (.Rock, .Win):
                return .Paper
        case (.Rock, .Loss):
                return .Scissors
        case (.Paper, .Win):
                return .Scissors
        case (.Paper, .Loss):
                return .Rock
        case (.Scissors, .Win):
                return .Rock
        case (.Scissors, .Loss):
                return .Paper
        }
    }
    
    var description: String {
        switch self {
        case .Rock:
            return "Rock"
        case .Paper:
            return "Paper"
        case .Scissors:
            return "Scissors"
        }
    }
}

struct ContentView: View {
    let possibleMoves: [Move] = [.Rock, .Paper, .Scissors]
    let results: [MatchResult] = [.Win, .Loss]
    
    @State private var moveToBeat = Int.random(in: 0..<3)
    @State private var resultToAchieve = Int.random(in: 0..<2)
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAnswer = false
    
    var correctAnswer: Move {
        possibleMoves[moveToBeat].correctMove(toAchieve: results[resultToAchieve])
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("What is should you pick to achieve a")
                Text(results[resultToAchieve].description)
                Text("against the all mighty")
                Text(possibleMoves[moveToBeat].description)
            }
            
            HStack {
                ForEach(possibleMoves, id: \.self) { move in
                    Button {
                        handleAnswer(move: move)
                    } label: {
                        Text(move.description)
                    }
                    .alert(alertTitle, isPresented: $showingAnswer) {
                        Button("Continue", action: newQuestion)
                    } message: {
                        Text(alertMessage)
                    }
                }
            }
        }
    }
    
    func newQuestion() {
        moveToBeat = Int.random(in: 0..<3)
        resultToAchieve = Int.random(in: 0..<2)
    }
    
    func handleAnswer(move: Move) {
        alertTitle = move == correctAnswer ? "Correct" : "Wrong"
        alertMessage = "The correct answer was \(correctAnswer.description)"
        showingAnswer = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
