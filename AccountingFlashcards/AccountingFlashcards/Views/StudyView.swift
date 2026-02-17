import SwiftUI

struct StudyView: View {
    @StateObject var session: StudySession
    @Environment(\.dismiss) var dismiss
    @State private var dragOffset: CGSize = .zero
    @State private var cardRotation: Double = 0

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                if session.isComplete {
                    ResultsView(session: session, onDismiss: { dismiss() })
                } else {
                    VStack(spacing: 0) {
                        progressHeader
                        cardArea
                        controlButtons
                    }
                }
            }
            .navigationTitle(session.deckTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Exit") { dismiss() }
                }
            }
        }
    }

    // MARK: - Progress Header

    private var progressHeader: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Card \(session.currentIndex + 1) of \(session.cards.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                HStack(spacing: 16) {
                    Label("\(session.correctCount)", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.subheadline)
                    Label("\(session.incorrectCount)", systemImage: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)

            ProgressView(value: session.progress)
                .accentColor(.blue)
                .padding(.horizontal)
        }
        .padding(.top, 16)
        .padding(.bottom, 8)
    }

    // MARK: - Card Area

    private var cardArea: some View {
        ZStack {
            if let card = session.currentCard {
                FlashcardView(
                    card: card,
                    isFlipped: session.isFlipped,
                    dragOffset: dragOffset
                )
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if session.isFlipped {
                                dragOffset = value.translation
                            }
                        }
                        .onEnded { value in
                            handleSwipe(value.translation)
                        }
                )
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        session.flipCard()
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 20)
    }

    // MARK: - Control Buttons

    private var controlButtons: some View {
        VStack(spacing: 16) {
            if !session.isFlipped {
                Button(action: {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        session.flipCard()
                    }
                }) {
                    Text("Reveal Answer")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }

                if let hint = session.currentCard?.hint {
                    HStack(spacing: 4) {
                        Image(systemName: "lightbulb")
                            .font(.caption)
                            .foregroundColor(.orange)
                        Text(hint)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                }
            } else {
                HStack(spacing: 12) {
                    ActionButton(
                        title: "Incorrect",
                        icon: "xmark",
                        color: .red,
                        action: {
                            withAnimation { session.markIncorrect() }
                        }
                    )

                    ActionButton(
                        title: "Skip",
                        icon: "arrow.right",
                        color: .orange,
                        action: {
                            withAnimation { session.markSkipped() }
                        }
                    )

                    ActionButton(
                        title: "Correct",
                        icon: "checkmark",
                        color: .green,
                        action: {
                            withAnimation { session.markCorrect() }
                        }
                    )
                }

                Text("Swipe right = Correct  •  Swipe left = Incorrect")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
        .padding(.top, 16)
    }

    // MARK: - Swipe Handling

    private func handleSwipe(_ translation: CGSize) {
        let threshold: CGFloat = 100

        if translation.width > threshold {
            withAnimation(.spring()) {
                session.markCorrect()
                dragOffset = .zero
            }
        } else if translation.width < -threshold {
            withAnimation(.spring()) {
                session.markIncorrect()
                dragOffset = .zero
            }
        } else {
            withAnimation(.spring()) {
                dragOffset = .zero
            }
        }
    }
}

struct ActionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(color.opacity(0.12))
            .foregroundColor(color)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color.opacity(0.3), lineWidth: 1)
            )
        }
    }
}
