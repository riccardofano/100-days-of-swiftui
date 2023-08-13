//
//  FileManagerDirectory.swift
//  BucketList
//
//  Created by Riccardo Fano on 2023-08-13.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeToDocumentsFile(filename: String, message: String) {
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        
        do {
            try message.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
}
