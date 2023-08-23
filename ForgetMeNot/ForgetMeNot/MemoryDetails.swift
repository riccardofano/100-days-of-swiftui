//
//  MemoryDetails.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct MemoryDetails: View {
    let memory: Memory
    
    var body: some View {
        VStack {
            Image(uiImage: memory.picture)
                .resizable()
                .scaledToFit()
            
            List {
                Text("Here's who was in it!")
                    .font(.title2)
                ForEach(memory.tagged, id: \.self) { tag in
                    Text(tag)
                }
            }
        }
        .navigationTitle(memory.description)
        
    }
}

