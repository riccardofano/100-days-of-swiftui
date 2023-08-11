//
//  ContentView.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-10.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var intensity: Double = 1
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture { }
                
                HStack {
                    Text("Filter intesity: \(intensity.formatted())")
                    Slider(value: $intensity, in: 0...1)
                }
                
                HStack {
                    Button("Change filter") {}
                    Spacer()
                    Button("Save", action: save)
                }
            }
            .navigationTitle("InstaFilters")
            .padding()
        }
    }
    
    func save() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
