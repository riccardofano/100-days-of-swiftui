//
//  ContentView.swift
//  WordScramble
//
//  Created by Riccardo Fano on 2023-07-09.
//

import SwiftUI

struct ContentView: View {
    @State private var word = ""
    
    var wordIsMisspelled: String {
        isWordMisspelled(word: word) ? "Misspelled" : "Correct"
    }
    
    var body: some View {
        VStack {
            Section {
                TextField("Check if your word is misspelled", text: $word)
                Text(wordIsMisspelled)
            }
            .padding()
            
            List {
                Section("First Section") {
                    Text("static row")
                    ForEach(0..<5) {
                        Text("Row \($0 + 1)")
                    }
                }
                
                Section("Second Section") {
                    Text("static row")
                    Text("static row")
                }
            }.listStyle(.sidebar)
            
            List(0..<5) {
                Text("Dynamic row \($0)")
            }
            
        }
    }
    
    func isWordMisspelled(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location != NSNotFound
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
               print(fileContents)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
