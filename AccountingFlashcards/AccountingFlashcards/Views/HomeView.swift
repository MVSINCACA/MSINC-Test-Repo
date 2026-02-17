import SwiftUI

struct HomeView: View {
    @EnvironmentObject var deckViewModel: DeckViewModel
    @State private var featuredDeckIndex: Int = 0

    private let featuredDecks: [Deck] = [
        AccountingContent.fundamentalsDeck,
        AccountingContent.debitsAndCreditsDeck,
        AccountingContent.journalEntriesDeck
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    headerSection
                    statsSection
                    featuredSection
                    quickStartSection
                }
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Accounting Flashcards")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome Back!")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top, 8)

            Text("Continue mastering accounting concepts")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)
        }
    }

    // MARK: - Stats

    private var statsSection: some View {
        HStack(spacing: 16) {
            StatCard(title: "Decks", value: "\(deckViewModel.totalDecks)", icon: "rectangle.stack.fill", color: .blue)
            StatCard(title: "Cards", value: "\(deckViewModel.totalCards)", icon: "rectangle.on.rectangle.fill", color: .green)
            StatCard(title: "Topics", value: "\(Flashcard.CardCategory.allCases.count)", icon: "tag.fill", color: .orange)
        }
        .padding(.horizontal)
    }

    // MARK: - Featured

    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "Featured Decks", subtitle: "Start here if you're new")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(featuredDecks) { deck in
                        NavigationLink(destination: DeckDetailView(deck: deck)) {
                            FeaturedDeckCard(deck: deck)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
        }
    }

    // MARK: - Quick Start

    private var quickStartSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(title: "All Decks", subtitle: "Choose any topic to study")

            VStack(spacing: 12) {
                ForEach(deckViewModel.decks) { deck in
                    NavigationLink(destination: DeckDetailView(deck: deck)) {
                        DeckRowCard(deck: deck)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Supporting Views

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

struct SectionHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

struct FeaturedDeckCard: View {
    let deck: Deck

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: categoryIcon(for: deck.category))
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Text("\(deck.cardCount) cards")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.85))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
            }

            Spacer()

            Text(deck.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(deck.description)
                .font(.caption)
                .foregroundColor(.white.opacity(0.85))
                .lineLimit(2)
        }
        .padding(16)
        .frame(width: 200, height: 150)
        .background(
            LinearGradient(
                colors: gradientColors(for: deck.color),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

struct DeckRowCard: View {
    let deck: Deck

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: gradientColors(for: deck.color),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 52, height: 52)

                Image(systemName: categoryIcon(for: deck.category))
                    .font(.title3)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(deck.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(deck.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(deck.cardCount)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("cards")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(14)
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Helper Functions

func categoryIcon(for category: Flashcard.CardCategory) -> String {
    switch category {
    case .fundamentals:     return "lightbulb.fill"
    case .balanceSheet:     return "scale.3d"
    case .incomeStatement:  return "chart.line.uptrend.xyaxis"
    case .cashFlow:         return "dollarsign.circle.fill"
    case .ratios:           return "percent"
    case .journalEntries:   return "pencil.and.list.clipboard"
    case .terminology:      return "text.book.closed.fill"
    case .debitsCredits:    return "arrow.left.arrow.right"
    }
}

func gradientColors(for deckColor: Deck.DeckColor) -> [Color] {
    switch deckColor {
    case .blue:   return [Color.blue, Color.blue.opacity(0.7)]
    case .green:  return [Color.green, Color.mint]
    case .orange: return [Color.orange, Color.yellow]
    case .purple: return [Color.purple, Color.indigo]
    case .red:    return [Color.red, Color.orange]
    case .teal:   return [Color.teal, Color.cyan]
    case .indigo: return [Color.indigo, Color.purple]
    case .pink:   return [Color.pink, Color.red]
    }
}
