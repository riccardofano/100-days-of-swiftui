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
    @State private var showingImagePicker = false
    
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
                .onTapGesture { showingImagePicker = true }
                
                HStack {
                    Text("Filter intesity")
                    Slider(value: $intensity, in: 0...1)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change filter") {}
                    Spacer()
                    Button("Save", action: save)
                }
            }
            .navigationTitle("InstaFilters")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .padding([.horizontal, .bottom])
        }
    }
    
    func save() {
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
