//
//  Alert.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/1/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
//    MARK: Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from server was invalid. Please contact support."),
                                       dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from server. Please try again later or contact support."),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidUrl = AlertItem(title: Text("Server Error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support"),
                                      dismissButton: .default(Text("OK")))

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))

//    MARK: Account Alerts
    static let missingInfo = AlertItem(title: Text("Missing Info"),
                                        message: Text("All fields are mandatory."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                        message: Text("Please check and re-enter your email address."),
                                        dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"),
                                        message: Text("Your profile info was successfully saved."),
                                        dismissButton: .default(Text("OK")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"),
                                        message: Text("There was an error saving or retrieving your profile."),
                                        dismissButton: .default(Text("OK")))
}
