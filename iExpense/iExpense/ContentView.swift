//
//  ContentView.swift
//  iExpense
//
//  Created by Riccardo Fano on 2023-07-16.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Something")
        }
    }
}

struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Second view with name: \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
