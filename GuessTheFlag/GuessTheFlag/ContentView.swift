//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Riccardo Fano on 2023-07-02.
//

import SwiftUI

struct ContentView: View {
    private let totalQuestions = 8;
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var answerCount = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    if showingFinalScore {
                        VStack(spacing: 20) {
                            Text("The game is over, you correctly guessed")
                                .font(.subheadline.weight(.heavy))
                                .foregroundStyle(.secondary)
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(score)")
                                    .font(.largeTitle.weight(.semibold))
                                    .foregroundStyle(.secondary)
                                Text("out of")
                                    .font(.subheadline.weight(.heavy))
                                    .foregroundStyle(.secondary)
                                Text("\(totalQuestions)")
                                    .font(.largeTitle.weight(.semibold))
                                    .foregroundStyle(.secondary)
                                Text("questions!")
                                    .font(.subheadline.weight(.heavy))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    } else {
                        VStack {
                            Text("Tap the flag of")
                                .font(.subheadline.weight(.heavy))
                                .foregroundStyle(.secondary)
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                                .foregroundStyle(.secondary)
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(index: number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .shadow(radius: 4)
                            }
                            .alert(scoreTitle, isPresented: $showingScore) {
                                Button("Continue", action: askQuestion)
                            } message: {
                                Text("Score is \(score)")
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Spacer()
                Spacer()
                if !showingFinalScore {
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    Spacer()
                }
            }
            .padding()
        }
    }
    
    func askQuestion() {
        if (answerCount == totalQuestions) {
            showingFinalScore = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func flagTapped(index: Int) {
        if index == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[correctAnswer])"
        }
        showingScore = true
        answerCount += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
