//
//  Appetizer.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/28/22.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    /*
     "imageURL": "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg",
     "protein": 14,
     "name": "Asian Flank Steak",
     "price": 8.99,
     "carbs": 0,
     "id": 1,
     "description": "This perfectly thin cut just melts in your mouth.",
     "calories": 300
     */
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Chicken Wings",
                                           description: "Spicy chicken wings",
                                           price: 20.0,
                                           imageURL: "",
                                           calories: 200,
                                           protein: 100,
                                           carbs: 50)
    
    static let appetizers = [sampleAppetizer,
                             sampleAppetizer,
                             sampleAppetizer,
                             sampleAppetizer]
}
