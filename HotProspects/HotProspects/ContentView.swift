//
//  ContentView.swift
//  HotProspects
//
//  Created by Riccardo Fano on 2023-09-02.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = await Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }.result
        
        switch fetchTask {
        case .success(let str):
            output = str
        case .failure(let err):
            output = "Error: \(err.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
