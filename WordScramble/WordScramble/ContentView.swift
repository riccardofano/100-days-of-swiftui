//
//  ContentView.swift
//  WordScramble
//
//  Created by Riccardo Fano on 2023-07-09.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords: [String] = []
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit { addWord() }
            .onAppear(perform: startGame)
        }
    }
    
    func startGame() {
        guard let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not load start.txt from bundle.")
        }
        
        guard let startWords = try? String(contentsOf: startWordURL) else {
            fatalError("Could not read the contents of start.txt")
        }
        
        let allWords = startWords.components(separatedBy: .newlines)
        rootWord = allWords.randomElement() ?? "silkworm"
    }
    
    func addWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        
        // Ok this is really cool
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
