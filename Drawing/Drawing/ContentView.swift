//
//  ContentView.swift
//  Drawing
//
//  Created by Riccardo Fano on 2023-07-23.
//

import SwiftUI

struct ContentView: View {
    @State private var rows = 4
    @State private var cols = 4
    
    @State private var amount = 20.0
    
    var body: some View {
        Checkerboard(rows: rows, columns: cols)
            .onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    rows = 8
                    cols = 16
                }
            }
        
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

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
