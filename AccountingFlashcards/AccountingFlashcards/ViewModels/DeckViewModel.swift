import Foundation
import Combine

class DeckViewModel: ObservableObject {
    @Published var decks: [Deck] = AccountingContent.allDecks
    @Published var searchText: String = ""
    @Published var selectedDifficulty: Flashcard.Difficulty? = nil
    @Published var selectedCategory: Flashcard.CardCategory? = nil

    var filteredDecks: [Deck] {
        var result = decks

        if !searchText.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }

        if let category = selectedCategory {
            result = result.filter { $0.category == category }
        }

        return result
    }

    func deck(for category: Flashcard.CardCategory) -> Deck? {
        decks.first { $0.category == category }
    }

    var totalCards: Int {
        decks.reduce(0) { $0 + $1.cardCount }
    }

    var totalDecks: Int {
        decks.count
    }
}
