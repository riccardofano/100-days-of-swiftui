//
//  ContentView.swift
//  Drawing
//
//  Created by Riccardo Fano on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 10.0
    
    @State private var colorCyclingAmount = 0.2
    @State private var startPoint = UnitPoint.top
    @State private var endPoint = UnitPoint.bottom
    
    let rectWidth = 300.0
    let rectHeight = 200.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: amount, lineCap: .round))
                .frame(width: 100, height: 200)
                .onTapGesture {
                    withAnimation {
                        amount = Double.random(in: 1...50)
                    }
                }
            
            ColorCyclingRectangle(amount: colorCyclingAmount, startPoint: startPoint, endPoint: endPoint)
                .frame(width: rectWidth, height: rectHeight)
                .onTapGesture { point in
                    startPoint = UnitPoint(x: point.x / rectWidth, y: point.y / rectHeight)
                    endPoint = UnitPoint(x: Double.random(in: 0...1), y: Double.random(in: 0...1))
                }
            
            Slider(value: $colorCyclingAmount)
        }
        .padding()
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

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    let steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: startPoint,
                            endPoint: endPoint
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
