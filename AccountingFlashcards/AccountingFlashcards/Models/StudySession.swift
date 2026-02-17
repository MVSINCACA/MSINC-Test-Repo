import Foundation

class StudySession: ObservableObject {
    @Published var cards: [Flashcard]
    @Published var currentIndex: Int = 0
    @Published var isFlipped: Bool = false
    @Published var correctCount: Int = 0
    @Published var incorrectCount: Int = 0
    @Published var skippedCount: Int = 0
    @Published var isComplete: Bool = false
    @Published var reviewedCards: [UUID: ReviewResult] = [:]

    enum ReviewResult {
        case correct, incorrect, skipped
    }

    let deckTitle: String

    init(deck: Deck) {
        self.cards = deck.cards.shuffled()
        self.deckTitle = deck.title
    }

    var currentCard: Flashcard? {
        guard currentIndex < cards.count else { return nil }
        return cards[currentIndex]
    }

    var progress: Double {
        guard !cards.isEmpty else { return 0 }
        return Double(currentIndex) / Double(cards.count)
    }

    var totalAnswered: Int {
        correctCount + incorrectCount + skippedCount
    }

    var scorePercentage: Int {
        guard totalAnswered > 0 else { return 0 }
        return Int((Double(correctCount) / Double(totalAnswered)) * 100)
    }

    func markCorrect() {
        guard let card = currentCard else { return }
        reviewedCards[card.id] = .correct
        correctCount += 1
        advance()
    }

    func markIncorrect() {
        guard let card = currentCard else { return }
        reviewedCards[card.id] = .incorrect
        incorrectCount += 1
        advance()
    }

    func markSkipped() {
        guard let card = currentCard else { return }
        reviewedCards[card.id] = .skipped
        skippedCount += 1
        advance()
    }

    func flipCard() {
        isFlipped.toggle()
    }

    private func advance() {
        isFlipped = false
        if currentIndex + 1 >= cards.count {
            isComplete = true
        } else {
            currentIndex += 1
        }
    }

    func restart() {
        cards = cards.shuffled()
        currentIndex = 0
        isFlipped = false
        correctCount = 0
        incorrectCount = 0
        skippedCount = 0
        isComplete = false
        reviewedCards = [:]
    }

    func restartMissed() {
        let missedCards = cards.filter { card in
            reviewedCards[card.id] == .incorrect || reviewedCards[card.id] == .skipped
        }
        guard !missedCards.isEmpty else { return }
        cards = missedCards.shuffled()
        currentIndex = 0
        isFlipped = false
        correctCount = 0
        incorrectCount = 0
        skippedCount = 0
        isComplete = false
        reviewedCards = [:]
    }
}
