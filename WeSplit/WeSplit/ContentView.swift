//
//  ContentView.swift
//  WeSplit
//
//  Created by Riccardo Fano on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    // Mutating a value inside a computed variable in a struct is not allowed
    // @State allows that value to be stored separately by SwiftUI in a place that can be modified
    // From the wording in the article it seems SwiftUI is creating a new struct every time a property changes kinda like in React where the whole component reruns every time
    // adding private is recommened with @State properties because they should only be accessed inside the same struct
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Ron"
    
    var body: some View {
        NavigationView {
            Form {
                // You can only have 10 sibling elements
                // so if you want to have more than that you can group them
                Section {
                    // You have to use ..< instead of ... ranges (will have to figure out why in another time)
                    // ForEach is not restricted by the 10 siblings constraint
                    // ForEach(1..<100) {
                        // Text("Row: \($0)")
                    // }
                    Picker("Select your student", selection: $selectedStudent) {
                        // ForEach needs an id to indentify the rows uniquely
                        // it's like React's keys
                        // NOTE: This doesn't update in the preview but works when the app is built
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    // $ makes a variable a 2 way binding
                    // I think this basically means "this function (TextField) is also allowed to modify `name`"
                    // othewise only I can modify it like we've seen with tapCount
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                // you specify the onClick event as a trailing closure
                Button("This button has been pressed \(tapCount) times.") {
                    tapCount += 1
                    name += "A"
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
