//
//  Card.swift
//  FlashZilla
//
//  Created by Riccardo Fano on 2023-09-07.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
