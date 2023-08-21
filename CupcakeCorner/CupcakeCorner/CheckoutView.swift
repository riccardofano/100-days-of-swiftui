//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Riccardo Fano on 2023-07-31.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var state: AppState
    
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    .accessibilityHidden(true)
                }
                
                Text("Your total is \(state.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task {
                        await placeOrder()
                    }
                }
                .alert(confirmationTitle, isPresented: $showingConfirmation) {
                    Button("Ok") {}
                } message: {
                    Text(confirmationMessage)
                }
                .padding()
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(state.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationTitle = "Thank you"
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
        } catch {
            confirmationTitle = "Oh no"
            confirmationMessage = "Something went wrong while trying to place your order :("
            print("Checkout failed miserably.")
        }
        showingConfirmation = true
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(state: AppState())
    }
}
