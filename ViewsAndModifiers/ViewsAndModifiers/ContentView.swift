//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Riccardo Fano on 2023-07-05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridStack(rows: 5, columns: 3) { row, column in
            Image(systemName: "\(row * 3 + column).circle")
            Text("\(row)\(column)")
        }
    }
}

// Custom modifier must conform to the ViewModifier protocol
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    // this is how you can name your custom modifier
    // instead of using .modifier(Name())
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
        // you use .modifier() to then specify your custom modifier,
            .modifier(Title())
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
