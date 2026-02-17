import Foundation

struct Deck: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String
    let category: Flashcard.CardCategory
    let cards: [Flashcard]
    var color: DeckColor

    enum DeckColor: String, Codable, CaseIterable {
        case blue = "blue"
        case green = "green"
        case orange = "orange"
        case purple = "purple"
        case red = "red"
        case teal = "teal"
        case indigo = "indigo"
        case pink = "pink"
    }

    var cardCount: Int { cards.count }
}
