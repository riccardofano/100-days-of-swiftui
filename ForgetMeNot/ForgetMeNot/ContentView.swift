//
//  ContentView.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//

import SwiftUI

struct ContentView: View {
    let pictures = [String]();
    @State private var showingAddImageView = false
    @StateObject var memories = Memories()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(pictures, id: \.self) { picture in
                        NavigationLink(destination: Text("Picture details view")) {
                            Text(picture)
                        }
                    }
                }
                
                NavigationLink(destination: AddImageView(memories: memories)) {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
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
