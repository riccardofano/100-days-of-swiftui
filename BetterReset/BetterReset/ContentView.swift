//
//  ContentView.swift
//  BetterReset
//
//  Created by Riccardo Fano on 2023-07-08.
//

import SwiftUI

struct ContentView: View {
    @State private var hoursOfSleep = 8.0
    
    var body: some View {
        Form {
            Stepper("\(hoursOfSleep.formatted()) hours", value: $hoursOfSleep, in: 2...12, step: 0.25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
