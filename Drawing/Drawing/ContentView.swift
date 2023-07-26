//
//  ContentView.swift
//  Drawing
//
//  Created by Riccardo Fano on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 10.0
    
    var body: some View {
        Arrow()
            .stroke(.red, style: StrokeStyle(lineWidth: amount, lineCap: .round))
            .frame(width: 100, height: 200)
            .onTapGesture {
                withAnimation {
                    amount = Double.random(in: 1...50)
                }
            }
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.move(to: CGPoint(x: rect.maxX / 2, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))

        return path
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
