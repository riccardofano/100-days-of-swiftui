//
//  ContentView.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-10.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    @State private var showingImagePicker = false
    
    @State private var showingFilterSheet = false
    
    @State private var intensity: Float = 1
    @State private var radius: Float = 20
    @State private var scale: Float = 8
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var inputKeys: [String] {
        currentFilter.inputKeys
    }
    
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
                
                VStack {
                    HStack {
                        Text("Filter intensity")
                        Slider(value: $intensity, in: 0...1)
                            .onChange(of: intensity) { _ in applyProcessing() }
                            .disabled(!inputKeys.contains(kCIInputIntensityKey))
                    }
                        
                    HStack {
                        Text("Filter radius")
                        Slider(value: $radius, in: 0...200)
                            .onChange(of: radius) { _ in applyProcessing() }
                            .disabled(!inputKeys.contains(kCIInputRadiusKey))
                    }
                        
                    HStack {
                        Text("Filter scale")
                        Slider(value: $scale, in: 0...20)
                            .onChange(of: scale) { _ in applyProcessing() }
                            .disabled(!inputKeys.contains(kCIInputScaleKey))
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change filter") {
                        showingFilterSheet = true
                    }
                    Spacer()
                    Button("Save", action: save)
                        .disabled(image == nil)
                }
            }
            .navigationTitle("InstaFilters")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Gloom") { setFilter(CIFilter.gloom()) }
                Button("Pointillize") { setFilter(CIFilter.pointillize()) }
                Button("Cancel", role: .cancel) { }
            }
            .padding([.horizontal, .bottom])
        }
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        let imageSaver = ImageSaver()
        
        imageSaver.errorHandler = {
            print("Error: \($0.localizedDescription)")
        }
        imageSaver.successHandler = {
            print("Saved with success!")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func applyProcessing() {
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(intensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(radius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(scale, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
