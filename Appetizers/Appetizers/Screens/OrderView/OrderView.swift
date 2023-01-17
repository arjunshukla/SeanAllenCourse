//
//  OrderView.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/26/22.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
//                List(viewModel.cartItems) { appetizer in
//                    AppetizerListCell(appetizer: appetizer)
//                }
                
                List {
                    ForEach(viewModel.cartItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItem)
                }
                .listStyle(PlainListStyle())
                
                APButton(title: "$\(viewModel.orderTotal, specifier: "%.2f") - Place Order")
                    .padding([.leading, .trailing, .bottom], 40)
            }
            .onAppear {
                viewModel.computeOrderTotal()
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItem(at offset: IndexSet) {
        viewModel.cartItems.remove(atOffsets: offset)
    }
}

struct AppetizerOrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
