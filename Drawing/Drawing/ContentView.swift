//
//  ContentView.swift
//  Drawing
//
//  Created by Riccardo Fano on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Circle()
                .strokeBorder(.blue, lineWidth: 40)
            
            CustomTriangle()
                .fill(.orange)
                .frame(width: 300, height: 100)
        
            CustomArc(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 229), clockwise: false)
                .strokeBorder(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel))
                .frame(width: 89, height: 200)
        }
        
    }
}

struct CustomTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct CustomArc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle(degrees: 90)
        let adjustedStart = startAngle - rotationAdjustment
        let adjustedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: adjustedStart, endAngle: adjustedEnd, clockwise: clockwise)

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
