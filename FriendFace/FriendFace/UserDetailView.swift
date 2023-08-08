//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    Characteristic(label: "Age", text: "\(user.age)")
                    Characteristic(label: "Email", text: user.email)
                    Characteristic(label: "Address", text: user.address)
                    Characteristic(label: "Joined", text: user.registered.formatted(date: .long, time: .standard))
                    Characteristic(label: "About", text: user.about)
                }
                
                Section("Tags") {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
                
                Section("My friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
            .navigationTitle(user.name)
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

struct UserDetailView_Previews: PreviewProvider {
    static let user = User(
        id: UUID(uuidString: "50a48fa3-2c0f-4397-ac50-64da464f9954")!,
        isActive: false,
        name:"Alford Rodriguez",
        age: 21,
        company: "Imkan",
        email: "alfordrodriguez@imkan.com",
        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: Date.now,
        tags: [ "cillum", "consequat", "deserunt", "nostrud", "eiusmod", "minim", "tempor" ],
        friends: [
            Friend(id: UUID(uuidString: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0")!, name: "Hawkins Patel"),
            Friend(id: UUID(uuidString: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6")!, name: "Jewel Sexton")
        ]
    )
    
    static var previews: some View {
        UserDetailView(user: user)
    }
}

