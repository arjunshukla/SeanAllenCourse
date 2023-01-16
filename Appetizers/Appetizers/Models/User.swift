//
//  User.swift
//  Appetizers
//
//  Created by Arjun Shukla on 1/14/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequestRefills = true
}
