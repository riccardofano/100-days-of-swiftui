//
//  Results.swift
//  BucketList
//
//  Created by Riccardo Fano on 2023-08-16.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
