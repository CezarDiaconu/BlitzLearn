//
//  SignInView.swift
//  learn
//
//  Created by Cezar Diaconu on 04.06.2026.
//

import SwiftUI
import SwiftData

struct SignInView: View {
    @Environment(\.modelContext) private var context
    
    @Binding var isSignedIn: Bool
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    let isVerified = DatabaseManager.shared.checkUser(username: username, password: password)
                    
                    if isVerified {
                        isSignedIn = true
                    } else{
                        print("Show an error message to the user here!")
                    }
                }) {
                    
                    Text("Sign In")
                }.buttonStyle(.borderedProminent)
                Button("Print All Users to Console") {
                    let userService = UserService()
                    userService.printAllUsers(context: context)
                }
                .buttonStyle(.bordered)
                NavigationLink(destination: SignUpView()) {
                    Text("Go to SignUp Form")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SignInView(isSignedIn: .constant(false))
        .modelContainer(for: User.self, inMemory: true)
}
