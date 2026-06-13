import Foundation

struct Exercise: Codable {
    let id: Int
    var type: String
    var prompt: String
    var question: String
    var options: [String]?
    var acceptedAnswers: [String]
}

class ExerciseLoader {
    
    // This function returns an array of your Exercise structs
    func loadExercises() -> [Exercise] {
        
        // 1. Locate the "exercises.json" file inside your app bundle
        guard let url = Bundle.main.url(forResource: "exercises", withExtension: "json") else {
            print("Error: Could not find exercises.json in the project.")
            return []
        }
        
        do {
            // 2. Read the file into raw Data
            let data = try Data(contentsOf: url)
            
            // 3. Create Swift's built-in decoder
            let decoder = JSONDecoder()
            
            // 4. Decode the data into an array of your Exercise struct
            let decodedExercises = try decoder.decode([Exercise].self, from: data)
            
            print("Successfully loaded \(decodedExercises.count) exercises!")
            return decodedExercises
            
        } catch {
            // If the JSON format doesn't perfectly match your struct, it prints the error here
            print("Failed to decode JSON: \(error)")
            return []
        }
    }
}
