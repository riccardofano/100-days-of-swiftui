//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Riccardo Fano on 2023-07-27.
//

import SwiftUI

enum CodingKeys: CodingKey {
    case order
}

class AppState: ObservableObject, Codable {
    @Published var order = Order()
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        order = try container.decode(Order.self, forKey: .order)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order, forKey: .order)
    }
}

struct Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasInvalidAddress: Bool {
        let allStrings = "\(name)\(streetAddress)\(city)\(zip)".trimmingCharacters(in: .whitespaces)
        return allStrings.isEmpty
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)

        if extraFrosting {
            cost += Double(quantity)
        }

        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
}

struct ContentView: View {
    @StateObject var state = AppState()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cupcake type", selection: $state.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cupcakes: \(state.order.quantity)", value: $state.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $state.order.specialRequestEnabled)
                    
                    if state.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $state.order.extraFrosting)
                        
                        Toggle("Add sprinkles", isOn: $state.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(state: state)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
