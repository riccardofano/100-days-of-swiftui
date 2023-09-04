//
//  Prospect.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-03.
//

import Foundation

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var email = ""
    fileprivate(set) var isContacted = false
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

@MainActor class Prospects: ObservableObject {
    let saveKey = "SavedData"
    let saveFile = "SavedData.json"
    
    @Published private(set) var people: [Prospect]
    
    init() {
        let url = getDocumentsDirectory().appendingPathComponent(saveFile)
        if let data = try? Data(contentsOf: url) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        self.people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            let saveFileUrl = getDocumentsDirectory().appending(path: saveFile)
            do {
                try encoded.write(to: saveFileUrl)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
