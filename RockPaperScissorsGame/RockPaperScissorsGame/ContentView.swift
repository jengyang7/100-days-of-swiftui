//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Jayden Kong on 14/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var appChoice: GameChoice = [.Rock, .Paper, .Scissors].randomElement()!
    @State private var expectedOutcome: GameOutcome = [.Win, .Lose].randomElement()!
    @State private var currentRound: Int = 1
    @State private var userScore: Int = 0
    @State private var isPlayerCorrect: Bool = false
    @State private var scoreTitle = ""

    @State private var isShowingScore = false
    @State private var isShowingGameOver = false

    let totalQuestions = 10
    let gameChoice: [GameChoice] = [.Rock, .Paper, .Scissors]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .blue]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("RPS Brain Game")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Text("Question: \(self.currentRound)/\(self.totalQuestions)")
                    .foregroundColor(.white)
                    .font(.title)
                VStack(spacing: 40) {
                    VStack(spacing: 30) {
                        Text("App picks: \(self.appChoice.description)")
                        Text("You need to: \(self.expectedOutcome.description)")
                    }
                    .font(.title)

                    HStack {
                        ForEach(self.gameChoice, id: \.self) { gameChoice in
                            Button {
                                choiceTapped(gameChoice)
                            } label: {
                                Text(gameChoice.description)
                                    .font(.system(size: 60))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 80)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(radius: 10)
                .padding(.horizontal)
                Text("Score: \(self.userScore)")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .alert(scoreTitle, isPresented: $isShowingScore) {
                Button("Continue", action: nextRound)
            } message: {
                isPlayerCorrect ?
                    Text("Correct, +1! Your score is now \(userScore).")
                    :
                    Text("Incorrect, -1! Your score is now \(userScore).")
            }
            .alert("Game Over!", isPresented: $isShowingGameOver) {
                Button("Play again", action: resetGame)
            } message: {
                Text("You final score is \(userScore).")
            }
        }
    }

    func choiceTapped(_ playerChoice: GameChoice) {
        var actualOutcome: GameOutcome

        switch (appChoice, playerChoice) {
        // Wining Scenarios
        case (.Rock, .Paper), (.Paper, .Scissors), (.Scissors, .Rock):
            actualOutcome = .Win

        // Losing Scenarios
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            actualOutcome = .Lose
        // Tying Scenarios
        case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
            actualOutcome = .Tie
        }

        isPlayerCorrect = actualOutcome == expectedOutcome
        userScore = isPlayerCorrect ? userScore + 1 : userScore - 1
        scoreTitle = isPlayerCorrect ? "Correct!" : "Incorrect!"

        isShowingScore = true
    }

    func nextRound() {
        isShowingScore = false
        if currentRound >= totalQuestions {
            isShowingGameOver = true
        } else {
            appChoice = [.Rock, .Paper, .Scissors].randomElement()!
            expectedOutcome = [.Win, .Lose].randomElement()!
            currentRound += 1
        }
    }

    func resetGame() {
        isShowingGameOver = false
        userScore = 0
        currentRound = 0
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(ProminentTitle())
    }
}

enum GameChoice: String, CaseIterable {
    case Rock = "🪨"
    case Paper = "📄"
    case Scissors = "✂️"

    var description: String {
        rawValue
    }
}

enum GameOutcome: String {
    case Win
    case Lose
    case Tie

    var description: String {
        rawValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
