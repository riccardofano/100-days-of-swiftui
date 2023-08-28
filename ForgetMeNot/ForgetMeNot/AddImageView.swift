//
//  AddImageView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI
import MapKit

struct AddImageView: View {
    @State private var uiImage: UIImage?
    @State private var imagePicked = false
    @State private var description = ""
    
    @State private var currentTag = ""
    @State private var tagged = [String]()
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5))
    let locationFetcher = LocationFetcher()
    
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
                
                Section("Add the location where the picture was taken") {
                    ZStack {
                        Map(coordinateRegion: $mapRegion)
                            .ignoresSafeArea()
                            .onAppear() {
                                self.locationFetcher.start();
                            }
                        
                        Image(systemName: "mappin")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32)
                            .foregroundColor(.red)
                    }
                    .padding(.vertical, 10)
                    .frame(height: 300)
                    
                    Button("Center") {
                        if let location = self.locationFetcher.lastKnownLocation {
                            mapRegion.center.latitude = location.latitude
                            mapRegion.center.longitude = location.longitude
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
                    newMemory.latitude = mapRegion.center.latitude
                    newMemory.longitude = mapRegion.center.longitude
                    
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
