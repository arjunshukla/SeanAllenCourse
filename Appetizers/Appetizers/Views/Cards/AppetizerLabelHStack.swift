//
//  AppetizerLabelHStack.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/5/23.
//

import SwiftUI

struct AppetizerLabelHStack: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title2)
            Text(subtitle)
                .font(.subheadline)
                .italic()
        }
    }
}

struct AppetizerLabelHStack_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerLabelHStack(title: "Calories", subtitle: "200")
    }
}
