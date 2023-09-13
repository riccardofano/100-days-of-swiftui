//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Riccardo Fano on 2023-09-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Text("Hello world")
                .frame(width: 300, height: 300, alignment: .topLeading)
                .background(.red)
            
            HStack(alignment: .lastTextBaseline) {
                Text("Hello")
                    .font(.caption)
                Text("World")
                Text("Foo")
                    .font(.title)
                Text("Bar")
                    .font(.largeTitle)
            }
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                }
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
