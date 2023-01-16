//
//  APButton.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/10/23.
//

import SwiftUI

struct APButton: View {
    private let title: LocalizedStringKey

    init(title: LocalizedStringKey) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 200, height: 50, alignment: .center)
            .background {
                Color.brandPrimary
            }
            .cornerRadius(8)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test title")
    }
}
