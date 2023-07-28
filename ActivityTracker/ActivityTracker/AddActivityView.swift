//
//  AddActivityView.swift
//  ActivityTracker
//
//  Created by Riccardo Fano on 2023-07-28.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = ""
    @State private var description = ""
    
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("New Activity", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add an activity")
            .toolbar {
                Button("Save") {
                    let activity = Activity(name: name, description: description, timesCompleted: 0)
                    activities.list.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
