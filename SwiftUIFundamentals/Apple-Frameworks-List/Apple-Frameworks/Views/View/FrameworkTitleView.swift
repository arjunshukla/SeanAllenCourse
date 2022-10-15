//
//  FrameworkTitleView.swift
//  Apple-Frameworks
//
//  Created by Arjun Shukla on 10/1/22.
//

import Foundation
import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework

    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
    }
}

struct IconView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        FrameworkTitleView(framework: MockData.sampleFramework)
            .preferredColorScheme(.dark)
    }
}
