//
//  ContentView.swift
//  BetterReset
//
//  Created by Riccardo Fano on 2023-07-08.
//

import SwiftUI

struct ContentView: View {
    @State private var hoursOfSleep = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        Form {
            Stepper("\(hoursOfSleep.formatted()) hours", value: $hoursOfSleep, in: 2...12, step: 0.25)
            DatePicker("Wake up time", selection: $wakeUp)
            // limit displayed components
            DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
            // hidden label but still useful for screen readers
            DatePicker("Wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            // date range constraits
            DatePicker("Wake up time", selection: $wakeUp, in: Date.now...)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
