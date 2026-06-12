//
//  User.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//

import Foundation
import SwiftData

@Model
class User {
    var username: String
    var email: String
    var password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
    
    func toString() -> String {
        return "User: \(username), \(email), \(password)"
    }
}
