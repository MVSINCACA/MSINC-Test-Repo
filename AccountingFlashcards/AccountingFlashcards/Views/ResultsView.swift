import SwiftUI

struct ResultsView: View {
    @ObservedObject var session: StudySession
    let onDismiss: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                scoreCircle
                statsGrid
                breakdownSection

                if session.incorrectCount > 0 || session.skippedCount > 0 {
                    retrySection
                }

                Button(action: onDismiss) {
                    Label("Back to Decks", systemImage: "arrow.left")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .foregroundColor(.primary)
                        .cornerRadius(14)
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 32)
        }
        .background(Color(.systemGroupedBackground))
    }

    // MARK: - Score Circle

    private var scoreCircle: some View {
        VStack(spacing: 16) {
            Text("Study Complete!")
                .font(.title2)
                .fontWeight(.bold)

            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 12)
                    .frame(width: 140, height: 140)

                Circle()
                    .trim(from: 0, to: CGFloat(session.scorePercentage) / 100)
                    .stroke(scoreColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .frame(width: 140, height: 140)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1.0), value: session.scorePercentage)

                VStack(spacing: 2) {
                    Text("\(session.scorePercentage)%")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(scoreColor)
                    Text("Score")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Text(performanceMessage)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }

    // MARK: - Stats Grid

    private var statsGrid: some View {
        HStack(spacing: 16) {
            ResultStatCard(
                value: "\(session.correctCount)",
                label: "Correct",
                color: .green,
                icon: "checkmark.circle.fill"
            )
            ResultStatCard(
                value: "\(session.incorrectCount)",
                label: "Incorrect",
                color: .red,
                icon: "xmark.circle.fill"
            )
            ResultStatCard(
                value: "\(session.skippedCount)",
                label: "Skipped",
                color: .orange,
                icon: "arrow.right.circle.fill"
            )
        }
        .padding(.horizontal)
    }

    // MARK: - Breakdown

    private var breakdownSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Card Results")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.horizontal)

            ForEach(session.cards) { card in
                let result = session.reviewedCards[card.id]
                CardResultRow(card: card, result: result)
            }
        }
    }

    // MARK: - Retry Section

    private var retrySection: some View {
        VStack(spacing: 12) {
            Text("Keep Practicing")
                .font(.headline)
                .fontWeight(.bold)

            HStack(spacing: 12) {
                Button(action: { session.restart() }) {
                    Label("Restart All", systemImage: "arrow.clockwise")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                }

                Button(action: { session.restartMissed() }) {
                    Label("Retry Missed", systemImage: "arrow.counterclockwise")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .foregroundColor(.orange)
                        .cornerRadius(12)
                }
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Helpers

    private var scoreColor: Color {
        switch session.scorePercentage {
        case 90...100: return .green
        case 70..<90:  return .blue
        case 50..<70:  return .orange
        default:       return .red
        }
    }

    private var performanceMessage: String {
        switch session.scorePercentage {
        case 90...100: return "Outstanding! You've mastered this material."
        case 70..<90:  return "Great work! A little more practice and you'll have it."
        case 50..<70:  return "Good effort! Keep reviewing the missed cards."
        default:       return "Keep going! Repetition is the key to learning."
        }
    }
}

struct ResultStatCard: View {
    let value: String
    let label: String
    let color: Color
    let icon: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(color.opacity(0.08))
        .cornerRadius(14)
    }
}

struct CardResultRow: View {
    let card: Flashcard
    let result: StudySession.ReviewResult?

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: resultIcon)
                .foregroundColor(resultColor)
                .frame(width: 24)

            Text(card.question)
                .font(.caption)
                .foregroundColor(.primary)
                .lineLimit(2)

            Spacer()

            Text(card.difficulty.rawValue)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(resultColor.opacity(0.05))
    }

    private var resultIcon: String {
        switch result {
        case .correct:   return "checkmark.circle.fill"
        case .incorrect: return "xmark.circle.fill"
        case .skipped:   return "arrow.right.circle.fill"
        case nil:        return "circle"
        }
    }

    private var resultColor: Color {
        switch result {
        case .correct:   return .green
        case .incorrect: return .red
        case .skipped:   return .orange
        case nil:        return .gray
        }
    }
}
