import SwiftUI

struct PracticeView: View {
    // let currentLesson: LessonData
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Let's practice some German!")
                .font(.title)
                .fontWeight(.bold)
            
            NavigationLink(destination: ExerciseView()) {
                ZStack {
                    // 1. The "Shadow" Circle (Darker Green, pushed down)
                    Circle()
                        .fill(Color(red: 0.2, green: 0.6, blue: 0.0))
                        .frame(width: 90, height: 90)
                        .offset(y: 8) // This offset creates the 3D depth!
                    
                    // 2. The Main Circle (Brighter Green)
                    Circle()
                        .fill(Color.green)
                        .frame(width: 90, height: 90)
                    
                    // 3. The Icon Inside
                    Image(systemName: "star.fill") // Built-in Apple SF Symbol
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
            }
            // To make the button scale down slightly when pressed
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    PracticeView()
}
