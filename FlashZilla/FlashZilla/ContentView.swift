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
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
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
            
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                        .padding(.leading)
                }
                
                Text("Success")
                    .padding()
            }
            .background(differentiateWithoutColor ? .black : .green)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Text("Hello, World!")
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(scale)
                .onTapGesture {
                    withOptionalAnimation {
                        scale *= 1.5
                    }
                }
        }
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
