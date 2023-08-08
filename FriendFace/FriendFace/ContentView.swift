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
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.email)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            let circleColor = user.isActive ? Color.green : Color.red
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
                }
            }
            .navigationTitle("All users")
            .task {
                if users.isEmpty {
                    await loadData()
                }
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
