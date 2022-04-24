import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            SubCharacterView()
//            MainCharacterView()
            DrawingQuizView()
//            ExerciseCharacterView()
        }.navigationViewStyle(.stack)
    }
}
