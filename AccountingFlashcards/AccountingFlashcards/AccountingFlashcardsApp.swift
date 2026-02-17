import SwiftUI

@main
struct AccountingFlashcardsApp: App {
    @StateObject private var deckViewModel = DeckViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(deckViewModel)
        }
    }
}
