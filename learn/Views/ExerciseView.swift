import SwiftUI

struct ExerciseView: View {
    // 1. Our State Variables
    @State private var exercises: [Exercise] = []
    @State private var currentIndex: Int = 0
    @State private var userAnswer: String = ""
    
    // Variables for the pop-up alert
    @State private var showFeedback: Bool = false
    @State private var isCorrect: Bool = false
    @State private var isFinished: Bool = false
    
    let loader = ExerciseLoader()
    
    var body: some View {
        NavigationStack {
            VStack {
                // If we are done with all questions, show the finish screen
                if isFinished {
                    VStack(spacing: 20) {
                        Text("🎉")
                            .font(.system(size: 80))
                        Text("Lesson Complete!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                } else if !exercises.isEmpty {
                    // Grab the single exercise we are currently on
                    let currentExercise = exercises[currentIndex]
                    
                    // A Duolingo-style Progress Bar at the top
                    ProgressView(value: Double(currentIndex), total: Double(exercises.count))
                        .padding()
                        .tint(.green)
                    
                    // The Content
                    VStack(alignment: .leading, spacing: 20) {
                        Text(currentExercise.prompt)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text(currentExercise.question)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        // 2. DYNAMIC UI based on the "type" from your JSON
                        if currentExercise.type == "multipleChoice" {
                            // Safely unwrap the options array
                            if let options = currentExercise.options {
                                ForEach(options, id: \.self) { option in
                                    Button(action: {
                                        userAnswer = option // Save the user's tap
                                    }) {
                                        Text(option)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            // Make the button turn blue if it is the currently selected answer
                                            .background(userAnswer == option ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                                            .cornerRadius(12)
                                            .foregroundColor(.primary)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(userAnswer == option ? Color.blue : Color.clear, lineWidth: 2)
                                            )
                                    }
                                }
                            }
                        } else if currentExercise.type == "translation" {
                            // If it's a translation, show a typing box instead of buttons
                            TextField("Type English translation...", text: $userAnswer)
                                .textFieldStyle(.roundedBorder)
                                .padding(.top, 10)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // 3. The Check Button
                    Button(action: checkAnswer) {
                        Text("Check Answer")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            // Gray out the button if they haven't typed/selected anything yet
                            .background(userAnswer.isEmpty ? Color.gray.opacity(0.5) : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .disabled(userAnswer.isEmpty) // Prevent clicking if empty
                    .padding()
                    
                } else {
                    ProgressView("Loading exercises...")
                }
            }
            .navigationTitle("Exercise")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // Load the JSON when the screen opens
                exercises = loader.loadExercises()
            }
            // 4. The Feedback Alert
            .alert(isCorrect ? "Correct! 🌟" : "Incorrect ❌", isPresented: $showFeedback) {
                            Button("Continue", action: nextQuestion)
                            } message: {
                            if !isCorrect && !exercises.isEmpty {
                                // Show the first item in the acceptedAnswers array (or an empty string as a fallback)
                                Text("An accepted answer was: \(exercises[currentIndex].acceptedAnswers.first ?? "")")
                            }
                        }
        }
    }
    
    // MARK: - Logic Functions
    
    func checkAnswer() {
            let currentExercise = exercises[currentIndex]
            
            let cleanUserAnswer = userAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            
            // THE NEW LOGIC: We loop through the accepted answers array to see if any of them match!
            isCorrect = currentExercise.acceptedAnswers.contains { acceptedAnswer in
                let cleanAcceptedAnswer = acceptedAnswer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                return cleanAcceptedAnswer == cleanUserAnswer
            }
            
            showFeedback = true
        }
    
    func nextQuestion() {
        // If we are not at the end of the array, go to the next question
        if currentIndex < exercises.count - 1 {
            currentIndex += 1
            userAnswer = "" // Clear the text field/button selection for the new question
        } else {
            // Otherwise, we are done!
            isFinished = true
        }
    }
}

#Preview {
    ExerciseView()
}
