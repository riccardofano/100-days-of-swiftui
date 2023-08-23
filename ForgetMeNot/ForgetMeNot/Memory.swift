//
//  Memory.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import Foundation
import SwiftUI

struct Memory: Identifiable {
    let id = UUID()
    let picture: UIImage
    let description: String
    let tagged: [String]
}

class Memories: ObservableObject {
    @Published var list: [Memory] = [Memory]()
    
    
}
