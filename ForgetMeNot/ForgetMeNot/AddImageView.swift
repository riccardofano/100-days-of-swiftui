//
//  AddImageView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct AddImageView: View {
    @State private var uiImage: UIImage?
    @State private var imagePicked = false
    @State private var description = ""
    
    @State private var currentTag = ""
    @State private var tagged = [String]()
    
    @ObservedObject var memories: Memories
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if imagePicked {
            Form {
                Image(uiImage: uiImage!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                TextField("Description", text: $description)
                
                Section("Appearing in the picture are:") {
                    HStack(spacing: 20) {
                        TextField("Person", text: $currentTag)
                        Button("Add") {
                            tagged.append(currentTag)
                            currentTag = ""
                        }
                    }
                    List {
                        ForEach(tagged, id: \.self) { tag in
                            Text(tag)
                        }
                    }
                }
                
                Button("Save") {
                    let newMemory = Memory(
                        picture: uiImage!,
                        description: description,
                        tagged: tagged
                    )
                    
                    memories.list.append(newMemory)
                    
                    uiImage = nil
                    description = ""
                    imagePicked = false
                    dismiss()
                }
            }
        } else {
            ImagePicker(image: $uiImage)
                .onChange(of: uiImage) { _ in imagePicked = true }
        }
    }
}

struct AddImageView_Previews: PreviewProvider {
    static let memories = Memories()
    
    static var previews: some View {
        AddImageView(memories: memories)
    }
}
