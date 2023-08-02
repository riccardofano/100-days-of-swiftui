//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Riccardo Fano on 2023-07-31.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var state: AppState;

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $state.order.name)
                    TextField("Street Address", text: $state.order.streetAddress)
                    TextField("City", text: $state.order.city)
                    TextField("Zip", text: $state.order.zip)
                }

                Section {
                    NavigationLink {
                        CheckoutView(state: state)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(state.order.hasInvalidAddress)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(state: AppState())
    }
}
