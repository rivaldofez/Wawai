import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            SubCharacterView()
//            MainCharacterView()
            ChoiceQuizView()
        }.navigationViewStyle(.stack)
    }
}
