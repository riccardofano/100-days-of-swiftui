//
//  ContentView.swift
//  WeSplit
//
//  Created by Riccardo Fano on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    let currencyFormat: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "EUR")

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return grandTotal / peopleCount
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField( "Amount", value: $checkAmount, format: currencyFormat )
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    // in the article this wants to create another page when you click on it
                    // it only works if this is inside a NavigationView (which is why we added it)
                    // BUT for me it's creating a popup and it didn't need a NavigationView to work, must be an iOS version difference
                    // adding .pickerStyle(.navigationLink) made it like in the article
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    // differently from the .navigationTitle this is applied to the Picker directly
                    .pickerStyle(.wheel)
                } header: {
                    Text("How much do you want to tip?")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Amount per person")
                }

                Section {
                    Text(grandTotal, format: currencyFormat)
                } header: {
                    Text("Grand total")
                }
            }
            // it seems counter intuitive but the navigation title is applied to the first child of the NavigationView
            // instead of the NavigationView itself, it's there because the view can show many screens and those should be ones dictating the name
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
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
