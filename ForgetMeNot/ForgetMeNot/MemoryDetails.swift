//
//  MemoryDetails.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MemoryDetails: View {
    let memory: Memory
    
    var annotation: Location {
        Location(coordinate: CLLocationCoordinate2D(latitude: memory.latitude, longitude: memory.longitude))
    }
    var annotations: [Location] {
        [annotation]
    }
    var mapRegion: MKCoordinateRegion {
        MKCoordinateRegion( center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50) )
    }
    
    var body: some View {
        VStack {
            Image(uiImage: memory.image!)
                .resizable()
                .scaledToFit()
            
            Map(coordinateRegion: .constant(mapRegion), annotationItems: annotations ) {
                MapAnnotation(coordinate: $0.coordinate) {
                    Image(systemName: "mappin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                        .foregroundColor(.red)
                }
            }
            
            List {
                Text("Here's who was in it!")
                    .font(.title2)
                ForEach(memory.taggedList, id: \.self) { person in
                    Text(person.wrappedName)
                }
            }
        }
        .navigationTitle(memory.wrappedName)
        
    }
}

