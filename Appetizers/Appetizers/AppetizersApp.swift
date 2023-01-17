//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Arjun Shukla on 12/26/22.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
