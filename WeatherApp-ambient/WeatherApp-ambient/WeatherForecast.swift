//
//  ContentView.swift
//  WeatherApp-ambient
//
//  Created by Arjun Shukla on 10/17/22.
//

import SwiftUI

struct WeatherForecast: View {
    @StateObject var viewModel: WeatherForecastViewModel = WeatherForecastViewModel()

    var body: some View {
        Text("Latitude")
        Text("Longitide")
        Text("Forecast:")
        Text("Location Name")
        Text(String(describing: $viewModel.forecast?.main.temp))
        Text("\($viewModel.forecast.weather.first!.weatherDescription)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecast()
    }
}
