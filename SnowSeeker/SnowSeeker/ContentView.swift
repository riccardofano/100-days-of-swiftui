//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Riccardo Fano on 2023-09-16.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum Order {
    case unset, byName, byCountry
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    @StateObject var favorites = Favorites()
    
    @State private var order: Order = .unset
    @State private var isShowingOrderBox = false
    
    var body: some View {
        NavigationView {
            List(orderedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button("Order by") { isShowingOrderBox = true }
            }
            .confirmationDialog("Order by", isPresented: $isShowingOrderBox) {
                Button("Default") { order = .unset }
                Button("By name") { order = .byName }
                Button("By country") { order = .byCountry }
                Button("Cancel", role: .cancel) {}
            }
            
            WelcomeView()
        }
        .phoneOnlyStackNavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var orderedResorts: [Resort] {
        switch order {
        case .unset:
            return filteredResorts
        case .byName:
            return filteredResorts.sorted {
                $0.name < $1.name
            }
        case .byCountry:
            return filteredResorts.sorted {
                $0.country < $1.country
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
