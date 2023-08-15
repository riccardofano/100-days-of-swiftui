//
//  Location.swift
//  BucketList
//
//  Created by Riccardo Fano on 2023-08-15.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
