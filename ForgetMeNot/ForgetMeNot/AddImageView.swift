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
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if imagePicked && uiImage != nil {
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
                    guard let image = uiImage else {
                        return
                    }
                    
                    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                    let path = paths[0]
                    
                    let image_id = UUID()
                    let url = path.appendingPathComponent("\(image_id).jpg")
                    
                    if let jpegData = image.jpegData(compressionQuality: 0.8) {
                        try? jpegData.write(to: url, options: [.atomic, .completeFileProtection])
                    }
                    
                    let newMemory = Memory(context: moc)
                    newMemory.id = image_id
                    newMemory.name = description
                    
                    for tag in tagged {
                        let newTag = Person(context: moc)
                        newTag.name = tag
                        newTag.memory = newMemory
                        
                        try? moc.save()
                    }
                    
                    try? moc.save()
                    
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
