//
//  ContentView.swift
//  InstaFilters
//
//  Created by Riccardo Fano on 2023-08-10.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

// Updating an @State wrapped value with or without $Binding
//struct ContentView: View {
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("Amount changed, now it's \(blurAmount)")
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) {
//                    print("Slider changed blurAmount, it's now \($0)")
//                }
//
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
//        .padding()
//    }
//}

// Creating a confirmationDialog
//struct ContentView: View {
//    @State private var showingConfirmation = false
//    @State private var backgroundColor = Color.yellow
//
//    var body: some View {
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .onTapGesture {
//                showingConfirmation = true
//            }
//            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
//                Button("Red") { backgroundColor = .red }
//                Button("Green") { backgroundColor = .green }
//                Button("Blue") { backgroundColor = .blue }
//                Button("Cancel", role: .cancel) { }
//            } message: {
//                Text("Select a new color")
//            }
//    }
//}

//struct ContentView: View {
//    @State private var image: Image?
//
//    var body: some View {
//        VStack {
//            image?
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear(perform: loadImage)
//    }
//
//    func loadImage() {
//        guard let inputImage = UIImage(named: "clouds") else {
//            return
//        }
//        let beginImage = CIImage(image: inputImage)
//        let context = CIContext()
//
////        let currentFilter = CIFilter.pixellate()
////        currentFilter.inputImage = beginImage
////        currentFilter.scale = 10
//
////        let currentFilter = CIFilter.crystallize()
////        currentFilter.inputImage = beginImage
////        currentFilter.radius = 30
//
////        let currentFilter = CIFilter.twirlDistortion()
////        currentFilter.inputImage = beginImage
////        currentFilter.radius = 300
////        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
//
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//
//        let amount = 1.0
//
//        // By checking which keys a filter has you can use whatever filter you want
//        // and set the correct key(s) to the value you should update for that filter
//        let inputKeys = currentFilter.inputKeys
//
//        // intensity for sepia
//        if inputKeys.contains(kCIInputIntensityKey) {
//            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
//        }
//        // radius for twirl/cystallize
//        if inputKeys.contains(kCIInputRadiusKey) {
//            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
//        }
//        // scale for pixellate
//        if inputKeys.contains(kCIInputScaleKey) {
//            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
//        }
//
//        guard let outputImage = currentFilter.outputImage else {
//            return
//        }
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
//            return
//        }
//        let uiImage = UIImage(cgImage: cgImage)
//        image = Image(uiImage: uiImage)
//    }
//}

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
