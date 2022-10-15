//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Arjun Shukla on 10/2/22.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    @Binding var isShowingDetailView: Bool
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            XDismissButton(isShowingModal: $isShowingDetailView)

            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            ScrollView {
                Text(framework.description)
                    .font(.body)
            }
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
