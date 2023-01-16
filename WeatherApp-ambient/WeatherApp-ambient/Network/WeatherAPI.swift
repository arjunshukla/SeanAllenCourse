//
//  WeatherAPI.swift
//  WeatherApp-ambient
//
//  Created by Arjun Shukla on 10/17/22.
//

import Foundation
import CoreLocation
// Current Weather API https://openweathermap.org/current
// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

// E.g Cupertino https://api.openweathermap.org/data/2.5/weather?lat=37.3230&lon=122.0322&appid=0f3a57d4cefe9d6a4ea79785740c725c

class WeatherAPI {
    private static let apiKey = "0f3a57d4cefe9d6a4ea79785740c725c"
    private static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    class func fetchCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (Forecast?)-> Void) {
        
        let urlString = baseURL + "?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=imperial"
        
        guard let url = URL(string: urlString) else {
            NSLog("Failed to create url for lat lon: \(lat), \(lon)")
            return
        }
        
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard data != nil else {
                NSLog("No data retrieved for \(lat), \(lon)")
                completion(nil)
                return
            }
            
            do {
                let forecast = try JSONDecoder().decode(Forecast.self, from: data!)
                
                completion(forecast)
                
                NSLog("Successfully fetched forecast for \(lat) \(lon): \(forecast)")
                
            } catch (let error) {
                NSLog("Failed to parse forecast json with error: \(error)")
                completion(nil)
                return
            }
        }.resume()
        
    }
}
