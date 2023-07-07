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
                        print(move == correctAnswer)
                    } label: {
                        Text(move.description)
                    }
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
