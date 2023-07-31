//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Riccardo Fano on 2023-07-31.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order;

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("Zip", text: $order.zip)
                }

                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(order.hasInvalidAddress)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
