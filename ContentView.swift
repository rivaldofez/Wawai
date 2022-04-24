import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            DashboardView()
        }.navigationViewStyle(.stack)
    }
}
