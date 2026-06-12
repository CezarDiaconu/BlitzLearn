import SwiftUI

struct LearnView: View {
    let chapters = learningPath
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 25) {
                Text("What do you want to learn today?")
                    .padding(20)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 25)
                
                List {
                    ForEach(chapters) { chapter in
                        Section(header: Text(chapter.title)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)) {
                                
                            ForEach(chapter.subchapters) { subchapter in
                                // THE FIX: Point directly to LessonView and pass the subchapter!
                                NavigationLink(destination: LessonView(subchapter: subchapter)) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(subchapter.title)
                                            .font(.body)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Learn")
        }
    }
}

#Preview {
    LearnView()
}
