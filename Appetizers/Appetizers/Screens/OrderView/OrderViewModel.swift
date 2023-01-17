//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/14/23.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    @Published var cartItems: [Appetizer] = MockData.orderItems
    @Published var orderTotal: Double = 0.0
    
    func computeOrderTotal() {
        var total = 0.0
        for appetizer in cartItems {
            total += appetizer.price
        }
        
        orderTotal = total
    }
}
