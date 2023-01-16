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
                List(viewModel.cartItems) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                
                APButton(title: "$\(viewModel.orderTotal, specifier: "%.2f") - Place Order")
                    .padding(.bottom, 40)
            }
            .onAppear {
                viewModel.computeOrderTotal()
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
