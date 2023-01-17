//
//  EmptyState.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/16/23.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            Text(message)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
        }

    }
}

struct OrderEmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(imageName: "empty-order", message: "You have no items in your order. \nThis new is line to test a longer string.")
    }
}
