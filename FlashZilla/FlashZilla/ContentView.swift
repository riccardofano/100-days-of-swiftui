//
//  ContentView.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-05.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0;
    @State private var finalAmount = 1.0;
    
    @State private var currentAngle = Angle.zero;
    @State private var finalAngle = Angle.zero;
    
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }

        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return VStack(spacing: 20) {
            Text("Tap")
                .onTapGesture {
                    print("Tapped the button")
                }
            Text("Double tap")
                .onTapGesture(count: 2) {
                    print("Tapped the button twice")
                }
            Text("Long press")
                .onLongPressGesture {
                    print("Long pressed the button")
                }
            Text("Long long press")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long pressed for at least 2 seconds")
                } onPressingChanged: { inProgress in
                    print("Is in progress: \(inProgress)")
                }
            Text("Magnification gesture")
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                )
            Text("Rotation gesture")
                .rotationEffect(finalAngle + currentAngle)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            currentAngle = angle
                        }
                        .onEnded { angle in
                            finalAngle += currentAngle
                            currentAngle = .zero
                        }
                )
            
            VStack {
                Text("Child")
                    .onTapGesture {
                        print("Text tapped")
                    }
            }
            // Child usually has priority unless you specify a higher priority
            .highPriorityGesture(
            // simultaneous triggers both gestures
            // .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        print("VStack tapped")
                    }
            )
            
            // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
            Circle()
                .fill(.red)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
