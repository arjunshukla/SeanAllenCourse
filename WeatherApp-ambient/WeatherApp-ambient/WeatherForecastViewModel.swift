//
//  WeatherForecastViewModel.swift
//  WeatherApp-ambient
//
//  Created by Arjun Shukla on 10/17/22.
//

import Foundation
import CoreLocation
import SwiftUI

final class WeatherForecastViewModel: ObservableObject {
    private var locationManager = CLLocationManager()
    private var lat: CLLocationDegrees?
    private var lon: CLLocationDegrees?
 
    @Published var forecast: Forecast?
    
    init() {
        getCurrentLocationCoordinates()
        fetchWeather()
    }
    
    func getCurrentLocationCoordinates() {
        locationManager.requestWhenInUseAuthorization()
              var currentLoc: CLLocation!
              if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
              CLLocationManager.authorizationStatus() == .authorizedAlways) {
                 currentLoc = locationManager.location
                  lat = currentLoc.coordinate.latitude
                 print(lat)
                  lon = currentLoc.coordinate.longitude
                 print(lon)
              }
    }
    
    func fetchWeather() {
        if let lat = lat,
           let lon = lon {
            WeatherAPI.fetchCurrentWeather(lat: lat, lon: lon) { forecast in
                guard let forecast = forecast else {
                    NSLog("No forecast")
                    return
                }
                
                self.forecast = forecast
                
            }
        }
    }
    
//    static let mock = WeatherForecastViewModel()
}
