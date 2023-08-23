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
            Image(uiImage: memory.image!)
                .resizable()
                .scaledToFit()
            
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

