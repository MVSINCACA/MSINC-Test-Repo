import Foundation

struct Flashcard: Identifiable, Codable {
    let id: UUID
    let question: String
    let answer: String
    let hint: String?
    let category: CardCategory
    var difficulty: Difficulty

    enum CardCategory: String, Codable, CaseIterable {
        case fundamentals = "Fundamentals"
        case balanceSheet = "Balance Sheet"
        case incomeStatement = "Income Statement"
        case cashFlow = "Cash Flow"
        case ratios = "Financial Ratios"
        case journalEntries = "Journal Entries"
        case terminology = "Terminology"
        case debitsCredits = "Debits & Credits"
    }

    enum Difficulty: String, Codable, CaseIterable {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
    }

    init(
        id: UUID = UUID(),
        question: String,
        answer: String,
        hint: String? = nil,
        category: CardCategory,
        difficulty: Difficulty = .beginner
    ) {
        self.id = id
        self.question = question
        self.answer = answer
        self.hint = hint
        self.category = category
        self.difficulty = difficulty
    }
}
