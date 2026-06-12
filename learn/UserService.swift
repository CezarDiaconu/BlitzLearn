//
//  UserService.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//

import Foundation
import SwiftData

class UserService{
    func printAllUsers(context: ModelContext){
        let fetchDescriptor = FetchDescriptor<User>()
        
        do{
            let allUsers = try context.fetch(fetchDescriptor)
            
            if allUsers.isEmpty{
                print("Database is empty.")
                return
            }
            
            print("--- List of All Users ---")
            for user in allUsers {
                // Using the toString() method you already created in your blueprint!
                print(user.toString())
            }
            print("-------------------------")
        }catch {
            // If something goes wrong reading the database, it will print the error here
            print("Failed to fetch users: \(error.localizedDescription)")
        }
    }
}
