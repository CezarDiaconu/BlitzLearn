import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isSignedIn = false
    
    @Environment(\.modelContext) private var context
    
    @AppStorage("hasLoadedExercises") private var hasLoadedExercises: Bool = false
    
    var body: some View {
        // 1. Wrap the if/else in a Group so we have something to attach .onAppear to!
        
        Group {
            if isSignedIn == true {
                MainTabView()
                
            } else {
                SignInView(isSignedIn: $isSignedIn)
            }
        }

        }
    }


#Preview {
    ContentView()
       /* .modelContainer(for: Exercise.self, inMemory: true) */
}
