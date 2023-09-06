//
//  ContentView.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-05.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase

    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Hello world")
            .onChange(of: scenePhase) { newPhase in
                switch newPhase {
                case .active:
                    print("App is not active")
                case .inactive:
                    print("App is now inactive")
                case .background:
                    print("App went to the background")
                default:
                    print("Unknown case")
                }
            }
            .onReceive(timer) { time in
                print("\(time)")
                timer.upstream.connect().cancel()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
