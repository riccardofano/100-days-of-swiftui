//
//  ContentView.swift
//  ActivityTracker
//
//  Created by Riccardo Fano on 2023-07-28.
//

import SwiftUI

struct Activity: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var timesCompleted: Int
}

class Activities: ObservableObject {
    init() {
        if let savedList = UserDefaults.standard.data(forKey: "ActivityList") {
            if let decodedList = try? JSONDecoder().decode([Activity].self, from: savedList) {
                list = decodedList
                return
            }
        }        
        list = [Activity(name: "An activity", description: "I did a thing", timesCompleted: 0)]
    }
    
    @Published var list: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(list) {
                UserDefaults.standard.set(encoded, forKey: "ActivityList")
            }
        }
    }
}


struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State private var showingAddActivitySheet = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(activities.list) { activity in
                    Text(activity.name)
                }
            }
            .navigationTitle("Activity tracker")
            .toolbar {
                Button {
                    showingAddActivitySheet = true
                } label: {
                    Image(systemName: "plus.square")
                }
            }
            .sheet(isPresented: $showingAddActivitySheet) {
                AddActivityView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
