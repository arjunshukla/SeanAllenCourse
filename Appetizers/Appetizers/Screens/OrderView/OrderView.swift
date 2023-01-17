//
//  OrderView.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/26/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed!")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            .padding(.bottom, 20)
                    }
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "No orders in your cart yet.\nPlease add an item from the appetizer list.")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct AppetizerOrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
