//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI

struct UserDetailView: View {
    let user: CachedUser
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    Characteristic(label: "Age", text: "\(user.age)")
                    Characteristic(label: "Email", text: user.email ?? "Unknown email")
                    Characteristic(label: "Address", text: user.address ?? "Unknown address")
                    Characteristic(label: "Joined", text: user.registered?.formatted(date: .long, time: .standard) ?? "Unknown date")
                    Characteristic(label: "About", text: user.about ?? "Nothing here")
                }
                
                Section("Tags") {
                    ForEach(user.tags?.components(separatedBy: ",") ?? [], id: \.self) { tag in
                        Text(tag)
                    }
                }
                
                Section("My friends") {
                    ForEach(user.friendList) { friend in
                        Text(friend.name ?? "Unknown friend")
                    }
                }
            }
            .navigationTitle(user.name ?? "Someone I know")
        }
    }
}

struct Characteristic: View {
    let label: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .fontWeight(.bold)
            Text(text)
                .foregroundColor(.black.opacity(0.7))
        }
    }
}
