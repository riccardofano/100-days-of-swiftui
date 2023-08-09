//
//  ContentView.swift
//  FriendFace
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI

struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name ?? "Unknown name")
                                Text(user.email ?? "")
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            ActivityIndicator(isActive: user.isActive)
                        }
                    }
                }
            }
            .navigationTitle("All users")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        
        //        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
        //            print("Invalid URL")
        //            return
        //        }
        
        // Read from a file to not bother the api
        guard let url = Bundle.main.url(forResource: "friendface", withExtension: "json") else {
            print("Invalid file path")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                await MainActor.run {
                    for user in decodedUsers {
                        let newUser = CachedUser(context: moc)
                        newUser.id = user.id
                        newUser.about = user.about
                        newUser.age = Int16(user.age)
                        newUser.company = user.company
                        newUser.email = user.email
                        newUser.isActive = user.isActive
                        newUser.name = user.name
                        newUser.registered = user.registered
                        newUser.tags = user.tags.joined(separator: ",")
                        
                        for friend in user.friends {
                            let newFriend = CachedFriend(context: moc)
                            newFriend.id = friend.id
                            newFriend.name = friend.name
                            newFriend.user = newUser
                        }
                        
                        // Need to make sure to save at each user otherwise not everything will get saved
                        try? moc.save()
                    }
                }
                
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActivityIndicator: View {
    let isActive: Bool
    var circleColor: Color { isActive ? Color.green : Color.red }
    
    var body: some View {
        Circle()
            .frame(width: 8, height: 8)
            .foregroundColor(circleColor)
            .overlay {
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(circleColor)
                    .opacity(0.2)
            }
    }
}
