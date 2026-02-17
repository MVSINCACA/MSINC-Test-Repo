import SwiftUI

struct FlashcardView: View {
    let card: Flashcard
    let isFlipped: Bool
    let dragOffset: CGSize

    private var rotationDegrees: Double {
        isFlipped ? 180 : 0
    }

    private var dragRotation: Double {
        Double(dragOffset.width) * 0.05
    }

    var body: some View {
        ZStack {
            if !isFlipped {
                frontFace
            } else {
                backFace
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
        .rotation3DEffect(.degrees(rotationDegrees), axis: (x: 0, y: 1, z: 0))
        .rotationEffect(.degrees(dragRotation))
        .offset(x: dragOffset.width * 0.5, y: 0)
        .shadow(
            color: shadowColor.opacity(0.3),
            radius: 12,
            x: dragOffset.width * 0.1,
            y: 4
        )
    }

    // MARK: - Front Face

    private var frontFace: some View {
        VStack(spacing: 20) {
            categoryBadge

            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 36))
                    .foregroundColor(.blue.opacity(0.5))

                Text(card.question)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 8)
            }

            Spacer()

            difficultyBadge

            Text("Tap to reveal answer")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(cardBackground)
        .cornerRadius(20)
    }

    // MARK: - Back Face

    private var backFace: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "checkmark.circle")
                    .font(.title3)
                    .foregroundColor(.green)
                Text("Answer")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                Spacer()
            }

            Divider()

            ScrollView {
                Text(card.answer)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()

            Text("Swipe or tap buttons below")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(answerBackground)
        .cornerRadius(20)
    }

    // MARK: - Supporting Views

    private var categoryBadge: some View {
        HStack {
            Image(systemName: categoryIcon(for: card.category))
                .font(.caption)
            Text(card.category.rawValue)
                .font(.caption)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.blue.opacity(0.1))
        .foregroundColor(.blue)
        .cornerRadius(8)
    }

    private var difficultyBadge: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(difficultyColor)
                .frame(width: 8, height: 8)
            Text(card.difficulty.rawValue)
                .font(.caption)
                .foregroundColor(difficultyColor)
        }
    }

    private var difficultyColor: Color {
        switch card.difficulty {
        case .beginner:     return .green
        case .intermediate: return .orange
        case .advanced:     return .red
        }
    }

    private var shadowColor: Color {
        guard dragOffset != .zero else { return .black }
        return dragOffset.width > 0 ? .green : .red
    }

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.separator).opacity(0.3), lineWidth: 1)
            )
    }

    private var answerBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green.opacity(0.3), lineWidth: 1.5)
            )
    }
}
