//
//  AppetizerCardView.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/5/23.
//

import SwiftUI

struct AppetizerCardView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack(spacing: 20) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
                
            
            Text(appetizer.name)
                .font(.largeTitle)
            
            Text(appetizer.description)
                .font(.body)
                .multilineTextAlignment(.center)
            
            HStack {
                AppetizerLabelHStack(title: "Calories", subtitle: "\(appetizer.calories)")
                
                AppetizerLabelHStack(title: "Carbs", subtitle: "\(appetizer.carbs) g")
                
                AppetizerLabelHStack(title: "Protien", subtitle: "\(appetizer.protein) g")
            }
            
            Spacer()
            
            Button {
                print("Place order tapped")
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .padding()
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                print("Close button tapped")
                isShowingDetail.toggle()
            } label: {
                XDismissButton()
            }
        }
    }
}

struct AppetizerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCardView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
    }
}
