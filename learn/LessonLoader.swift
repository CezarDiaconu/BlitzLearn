import Foundation

// 1. The Data Models (Make sure these are in your file!)
struct LessonData: Codable, Identifiable {
    let id: Int
    let title: String
    let words: [VocabularyWord]
}

struct VocabularyWord: Codable, Identifiable {
    // Adding an id makes it easier to use in SwiftUI Lists
    var id: String { german }
    let article: String
    let german: String
    let english: String
}

// 2. The Loader Class
class LessonLoader {
    
    // This function returns an array of all your lessons
    func loadLessons() -> [LessonData] {
        
        // 1. Locate the "lessons.json" file
        guard let url = Bundle.main.url(forResource: "lessons", withExtension: "json") else {
            print("Error: Could not find lessons.json in the project.")
            return []
        }
        
        do {
            // 2. Read the file into raw Data
            let data = try Data(contentsOf: url)
            
            // 3. Create the decoder
            let decoder = JSONDecoder()
            
            // 4. Decode the data into an array of LessonData structs
            // NOTE: If your JSON file starts with a { instead of a [, change
            // [LessonData].self to just LessonData.self
            let decodedLessons = try decoder.decode([LessonData].self, from: data)
            
            print("Successfully loaded \(decodedLessons.count) lessons!")
            return decodedLessons
            
        } catch {
            print("Failed to decode JSON: \(error)")
            return []
        }
    }
}
