//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Riccardo Fano on 2023-08-17.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        // error
                    }
                }
            } else {
                // no biometrics
            }
        }
        
        func addLocation() {
            let newLocation = Location(
                id: UUID(),
                name: "New location",
                description: "New location description",
                latitude: mapRegion.center.latitude,
                longitude: mapRegion.center.longitude
            )
            locations.append(newLocation)
            self.save()
        }
        
        func updateLocation(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
            self.save()
        }
    }
}
