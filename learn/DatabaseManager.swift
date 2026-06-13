import Foundation
import SQLite
import SQLite3

class DatabaseManager{
    static let shared = DatabaseManager()
    private var db: Connection?
    
    private let usersTable = Table("users")
    private let id = Expression<Int>("id")
    private let username = Expression<String>("username")
    private let email = Expression<String>("email")
    private let password = Expression<String>("password")
    
    private init() {
            do {
                let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                db = try Connection("\(path)/blitzlearn.sqlite3")
                print("Successfully connected to SQLite database!")
                print("DB PATH: \(path)/blitzlearn.sqlite3")
                try createTables()
            } catch {
                print("Failed to connect to database: \(error)")
            }
        }
    
    private func createTables() throws{
        try db?.run (usersTable.create(ifNotExists:true){ table in
            table.column(id, primaryKey: .autoincrement)
            table.column(username, unique: true)
            table.column(email, unique: true)
            table.column(password)
        }) 
    }
    
    func insertUser(username: String, email: String, password: String){
        do {
            let insertQuery = usersTable.insert(
                self.username <- username,
                self.email <- email,
                self.password <- password
            )
            
            try db?.run(insertQuery)
            print("Successfully created user: \(username)")
        } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT {
            // This catches the error if someone tries to use an email/username that already exists!
            print("Constraint failed: \(message). Username or Email might already exist.")
        } catch {
            print("Failed to insert user: \(error)")
        }
    }
    
    func checkUser(username: String, password: String) -> Bool{
        do {
            let query = usersTable.filter(self.username == username && self.password == password)
            
            if let matchedUser = try db?.pluck(query){
                print("Login successful for user ID: \(matchedUser[self.id])")
                return true
                } else {
                    // No rows matched that exact username and password combination
                    print("Login failed: Invalid username or password.")
                    return false
                }
            } catch {
                print("Database error during verification: \(error)")
                return false
            }
        }
}


