import SwiftUI

struct LessonView: View {
    // It catches the subchapter you tapped on in the main menu
    let subchapter: Subchapter
    
    // We start with an empty list of words
    @State private var words: [VocabularyWord] = []
    
    let lessonLoader = LessonLoader()
    
    var body: some View {
        List(words) { word in
            HStack {
                Text(word.article)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                
                Text(word.german)
                    .font(.headline)
                
                Spacer()
                
                Text(word.english)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
        .navigationTitle(subchapter.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // 1. Read the JSON file
            let allLessons = lessonLoader.loadLessons()
            
            // 2. Search the JSON for the lesson that matches our Subchapter's jsonId
            if let matchedLesson = allLessons.first(where: { $0.id == subchapter.jsonId }) {
                // 3. If we find a match, fill the screen with those words!
                self.words = matchedLesson.words
            }
        }
    }
}
