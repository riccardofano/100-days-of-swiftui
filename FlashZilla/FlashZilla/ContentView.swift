//
//  ContentView.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-05.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0;
    
    var body: some View {
        Text("Hello world")
            .onReceive(timer) { time in
                if (counter == 5) {
                    timer.upstream.connect().cancel()
                    return
                }
                counter += 1;
                print("\(time)")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
