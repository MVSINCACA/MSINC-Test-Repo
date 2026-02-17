import SwiftUI

struct DeckDetailView: View {
    let deck: Deck
    @State private var showStudySession = false
    @State private var showCardList = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerBanner
                    .frame(height: 200)

                VStack(alignment: .leading, spacing: 20) {
                    deckInfoSection
                    actionButtons
                    cardPreviewSection
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showStudySession) {
            StudyView(session: StudySession(deck: deck))
        }
    }

    // MARK: - Header Banner

    private var headerBanner: some View {
        ZStack {
            LinearGradient(
                colors: gradientColors(for: deck.color),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(spacing: 12) {
                Image(systemName: categoryIcon(for: deck.category))
                    .font(.system(size: 48))
                    .foregroundColor(.white)

                Text(deck.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
    }

    // MARK: - Deck Info

    private var deckInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(deck.description)
                .font(.body)
                .foregroundColor(.secondary)

            HStack(spacing: 16) {
                InfoChip(icon: "rectangle.on.rectangle", text: "\(deck.cardCount) Cards")
                InfoChip(icon: "tag", text: deck.category.rawValue)
                InfoChip(icon: "chart.bar", text: difficultyRange)
            }
        }
        .padding(.top, 8)
    }

    private var difficultyRange: String {
        let difficulties = Set(deck.cards.map { $0.difficulty })
        if difficulties.count == 1 {
            return difficulties.first!.rawValue
        }
        return "Mixed"
    }

    // MARK: - Action Buttons

    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button(action: { showStudySession = true }) {
                Label("Start Studying", systemImage: "play.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: gradientColors(for: deck.color),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }

            Button(action: { showCardList.toggle() }) {
                Label(showCardList ? "Hide Cards" : "Browse All Cards", systemImage: showCardList ? "chevron.up" : "list.bullet")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .foregroundColor(.primary)
                    .cornerRadius(14)
            }
        }
    }

    // MARK: - Card Preview

    private var cardPreviewSection: some View {
        Group {
            if showCardList {
                VStack(alignment: .leading, spacing: 12) {
                    Text("All Cards")
                        .font(.headline)
                        .fontWeight(.bold)

                    ForEach(deck.cards.indices, id: \.self) { index in
                        CardPreviewRow(card: deck.cards[index], number: index + 1)
                    }
                }
            }
        }
    }
}

struct InfoChip: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
            Text(text)
                .font(.caption)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

struct CardPreviewRow: View {
    let card: Flashcard
    let number: Int
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button(action: { withAnimation { isExpanded.toggle() } }) {
                HStack {
                    Text("\(number).")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .frame(width: 24, alignment: .leading)

                    Text(card.question)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            if isExpanded {
                Divider()
                Text(card.answer)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading, 28)
            }
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.04), radius: 3, x: 0, y: 1)
    }
}
