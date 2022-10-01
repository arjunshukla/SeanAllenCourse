//
//  WeatherView.swift
//  SwiftUIWeatherApp
//
//  Created by Arjun Shukla on 9/24/22.
//

import SwiftUI


struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Buttton Preview", textColor: .yellow, backgroundColor: .black)
    }
}
