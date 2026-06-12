import SwiftUI
import SwiftData

struct SignUpView: View {
    @Environment(\.modelContext) private var context
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                let newUser = User(username: username, email: email, password: password)
                context.insert(newUser)
                
                print("username: \(username) email: \(email) password: \(password)")
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            // 3. Replaced the NavigationLink with a standard Button
            // that triggers the dismiss action.
            Button(action: {
                dismiss() // This pops the view off the stack and goes back to SignInView
            }) {
                Text("Go back to Sign In")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 10)
        }
        .padding()
        .onAppear {
            print("Database is here: ", URL.applicationSupportDirectory.path())
        }
        // This adds a clean title to the top of the screen
        .navigationTitle("Create Account")
    }
}

#Preview {
    SignUpView()
        .modelContainer(for: User.self, inMemory: true)
}
