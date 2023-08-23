//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddImageView = false
    @StateObject var memories = Memories()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(memories.list) { memory in
                        NavigationLink(destination: MemoryDetails(memory: memory)) {
                            HStack(spacing: 20) {
                                Image(uiImage: memory.picture)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .frame(width: 50, height: 50)
                                
                                Text(memory.description)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: AddImageView(memories: memories)) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(.blue)
                                .clipShape(Circle())
                                .padding(.trailing, 30)
                        }
                    }
                }
                
            }
            .navigationTitle("Forget me not")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
