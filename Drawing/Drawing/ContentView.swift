//
//  ContentView.swift
//  Drawing
//
//  Created by Riccardo Fano on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 20.0
    
    var body: some View {
        Trapezoid(insetAmount: amount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    amount = Double.random(in: 0...200)
                }
            }
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    // the value *needs* to be called animatableData
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: animatableData, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - animatableData, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
