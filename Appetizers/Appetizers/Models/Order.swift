//
//  Order.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/16/23.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItem(at offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
