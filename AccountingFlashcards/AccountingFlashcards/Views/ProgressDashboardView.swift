import SwiftUI

struct ProgressDashboardView: View {
    @EnvironmentObject var deckViewModel: DeckViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    overviewSection
                    topicsSection
                    tipsSection
                }
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Progress")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // MARK: - Overview

    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Overview", subtitle: "Your accounting study library")

            VStack(spacing: 12) {
                overviewCard(
                    icon: "rectangle.stack.fill",
                    title: "Total Decks",
                    value: "\(deckViewModel.totalDecks)",
                    color: .blue
                )
                overviewCard(
                    icon: "rectangle.on.rectangle.fill",
                    title: "Total Flashcards",
                    value: "\(deckViewModel.totalCards)",
                    color: .green
                )
                overviewCard(
                    icon: "tag.fill",
                    title: "Topics Covered",
                    value: "\(Flashcard.CardCategory.allCases.count)",
                    color: .purple
                )
                overviewCard(
                    icon: "chart.bar.doc.horizontal",
                    title: "Difficulty Levels",
                    value: "\(Flashcard.Difficulty.allCases.count)",
                    color: .orange
                )
            }
            .padding(.horizontal)
        }
    }

    private func overviewCard(icon: String, title: String, value: String, color: Color) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.12))
                    .frame(width: 44, height: 44)
                Image(systemName: icon)
                    .foregroundColor(color)
            }
            Text(title)
                .font(.subheadline)
                .foregroundColor(.primary)
            Spacer()
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .padding(14)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.04), radius: 3, x: 0, y: 1)
    }

    // MARK: - Topics

    private var topicsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Topics", subtitle: "Cards per category")

            VStack(spacing: 8) {
                ForEach(deckViewModel.decks) { deck in
                    TopicProgressRow(deck: deck, totalCards: deckViewModel.totalCards)
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - Tips

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Study Tips", subtitle: "Learn accounting effectively")

            VStack(spacing: 10) {
                StudyTipCard(
                    icon: "repeat.circle.fill",
                    color: .blue,
                    title: "Spaced Repetition",
                    tip: "Review difficult cards more frequently. Use the 'Retry Missed' feature after each session."
                )
                StudyTipCard(
                    icon: "brain.head.profile",
                    color: .purple,
                    title: "Active Recall",
                    tip: "Try to answer before flipping the card. This strengthens memory much more than passive reading."
                )
                StudyTipCard(
                    icon: "link",
                    color: .green,
                    title: "Connect Concepts",
                    tip: "Accounting concepts are interconnected. Notice how the Balance Sheet, Income Statement, and Cash Flow Statement relate."
                )
                StudyTipCard(
                    icon: "pencil.and.list.clipboard",
                    color: .orange,
                    title: "Practice Journal Entries",
                    tip: "Writing out journal entries by hand reinforces debit/credit rules. Practice with real examples."
                )
            }
            .padding(.horizontal)
        }
    }
}

struct TopicProgressRow: View {
    let deck: Deck
    let totalCards: Int

    private var fraction: Double {
        totalCards > 0 ? Double(deck.cardCount) / Double(totalCards) : 0
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: categoryIcon(for: deck.category))
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(deck.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
                Text("\(deck.cardCount) cards")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(.systemGray5))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(
                            LinearGradient(
                                colors: gradientColors(for: deck.color),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * CGFloat(fraction), height: 6)
                }
            }
            .frame(height: 6)
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

struct StudyTipCard: View {
    let icon: String
    let color: Color
    let title: String
    let tip: String

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(tip)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(14)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.04), radius: 3, x: 0, y: 1)
    }
}
