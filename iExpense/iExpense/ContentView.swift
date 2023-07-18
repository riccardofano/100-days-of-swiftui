//
//  ContentView.swift
//  iExpense
//
//  Created by Riccardo Fano on 2023-07-16.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var expenseGroups: (personal: [ExpenseItem], business: [ExpenseItem]) {
        let initial = (personal: [ExpenseItem](), business: [ExpenseItem]())
        return expenses.items.reduce(into: initial, { (accumulator, current) in
            if current.type == "Personal" {
                accumulator.personal.append(current)
            } else {
                accumulator.business.append(current)
            }
        })
    }
    
    var body: some View {
        NavigationView {
            List {
                if !expenseGroups.personal.isEmpty {
                    Section("Personal") {
                        ForEach(expenseGroups.personal) { item in
                            ListItem(item: item)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                
                if !expenseGroups.business.isEmpty {
                    Section("Business") {
                        ForEach(expenseGroups.business) { item in
                            ListItem(item: item)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ListItem: View {
    let item: ExpenseItem
    
    let currencyFormatter: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            Text(item.amount, format: currencyFormatter)
        }
        .listRowBackground(item.amount > 100 ? Color.orange : item.amount > 10 ? Color.yellow : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
