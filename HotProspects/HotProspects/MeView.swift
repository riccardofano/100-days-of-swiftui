//
//  MeView.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-03.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @EnvironmentObject var prospects: Prospects;
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                HStack {
                    Spacer()
                    Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("Your code")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.trimmingCharacters(in: .whitespacesAndNewlines).utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
