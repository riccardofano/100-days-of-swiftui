//
//  RatingView.swift
//  Bookworm
//
//  Created by Riccardo Fano on 2023-08-05.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
           
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number <= rating ? onColor : offColor)
                    .onTapGesture {
                        withAnimation {
                            rating = number
                        }
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number < rating {
            return onImage
        }
        return (offImage ?? onImage)
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
