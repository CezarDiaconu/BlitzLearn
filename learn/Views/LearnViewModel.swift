import Foundation

struct Subchapter: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let jsonId: Int // <-- We added this!
}

struct Chapter: Identifiable {
    let id = UUID()
    let title: String
    let subchapters: [Subchapter]
}

let learningPath: [Chapter] = [
    Chapter(title: "Chapter One", subchapters: [
        // Notice how jsonId: 1 matches the "id": 1 in your JSON file!
        Subchapter(title: "The members of the family", description: "Learn the members of the family", jsonId: 1),
        Subchapter(title: "Personal Pronouns", description: "Learn how to use personal pronouns", jsonId: 2),
        Subchapter(title: "Auxiliary Verbs", description: "Learn the auxiliary verbs", jsonId: 3)
    ]),
    Chapter(title: "Chapter Two", subchapters: [
        Subchapter(title: "test", description: "test", jsonId: 4),
        Subchapter(title: "test", description: "test", jsonId: 5),
        Subchapter(title: "", description: "", jsonId: 6)
    ])
]
