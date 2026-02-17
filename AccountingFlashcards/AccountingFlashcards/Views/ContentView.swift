import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            DeckListView()
                .tabItem {
                    Label("Decks", systemImage: "rectangle.stack.fill")
                }

            ProgressDashboardView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
        }
        .accentColor(.blue)
    }
}
