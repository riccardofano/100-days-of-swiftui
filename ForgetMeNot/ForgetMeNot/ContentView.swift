//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var memories: FetchedResults<Memory>
    
    @State private var showingAddImageView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(memories) { memory in
                        NavigationLink(destination: MemoryDetails(memory: memory)) {
                            HStack(spacing: 20) {
                                if memory.image != nil {
                                    Image(uiImage: memory.image!)
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                        .frame(width: 40, height: 40)
                                }
                                
                                Text(memory.wrappedName)
                            }
                        }
                        .padding(5)
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: AddImageView()) {
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
