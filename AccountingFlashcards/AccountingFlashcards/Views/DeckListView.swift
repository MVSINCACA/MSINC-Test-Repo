import SwiftUI

struct DeckListView: View {
    @EnvironmentObject var deckViewModel: DeckViewModel
    @State private var searchText = ""

    var filteredDecks: [Deck] {
        if searchText.isEmpty {
            return deckViewModel.decks
        }
        return deckViewModel.decks.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText) ||
            $0.category.rawValue.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredDecks) { deck in
                    NavigationLink(destination: DeckDetailView(deck: deck)) {
                        DeckListRow(deck: deck)
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .background(Color(.systemGroupedBackground))
            .searchable(text: $searchText, prompt: "Search decks...")
            .navigationTitle("Study Decks")
            .navigationBarTitleDisplayMode(.large)
            .overlay {
                if filteredDecks.isEmpty {
                    ContentUnavailableView(
                        "No Decks Found",
                        systemImage: "rectangle.stack.badge.minus",
                        description: Text("Try a different search term")
                    )
                }
            }
        }
    }
}

struct DeckListRow: View {
    let deck: Deck

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(
                        LinearGradient(
                            colors: gradientColors(for: deck.color),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                Image(systemName: categoryIcon(for: deck.category))
                    .font(.title2)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(deck.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(deck.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    Image(systemName: "rectangle.on.rectangle")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text("\(deck.cardCount) cards")
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    Text("•")
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    Text(deck.category.rawValue)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
    }
}
