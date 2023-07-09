//
//  ContentView.swift
//  BetterRest
//
//  Created by Riccardo Fano on 2023-07-08.
//

import SwiftUI
import CoreML

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var hoursOfSleep = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                }
                
                Section {
                    Stepper("\(hoursOfSleep.formatted()) hours", value: $hoursOfSleep, in: 2...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                }
                
                Picker("Daily coffee intake", selection: $coffeeAmount) {
                    ForEach(1..<21) { cup in
                        Text(cup == 1 ? "1 cup" : "\(cup) cups")
                    }
                }.pickerStyle(.wheel)
                
                Section {
                    Text(calculateBedtime())
                        .font(.title)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: hoursOfSleep,
                coffee: Double(coffeeAmount)
            )
            let sleepTime = wakeUp - prediction.actualSleep
            return "Your ideal bedtime is… \(sleepTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
