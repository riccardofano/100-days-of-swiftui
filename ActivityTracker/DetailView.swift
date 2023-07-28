//
//  DetailView.swift
//  ActivityTracker
//
//  Created by Riccardo Fano on 2023-07-28.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activities: Activities
    let index: Int
    
    var activity: Activity {
        activities.list[index]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(activity.description)
                        .font(.body)
                        .padding(.bottom)
                    
                    Text("You've completed this activity \(activity.timesCompleted) times.")
                        .font(.headline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Button("I've done it again!") {
                    var newActivity = activities.list[index]
                    newActivity.timesCompleted += 1
                    
                    activities.list[index] = newActivity
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle(activity.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let activities = Activities()
    
    static var previews: some View {
        DetailView(activities: activities, index: 0)
    }
}
