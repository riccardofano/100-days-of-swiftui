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

struct Friend: Codable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(user.isActive ? Color.green : Color.red)
                                .padding(.trailing)
                            Text(user.name)
                        }
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        print("Loaded data")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                users = decodedUsers
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
