//
//  ContentView.swift
//  02-GuessTheFlag
//
//  Created by Jeng Yang on 08/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var pressedNumber = 0
    @State private var round = 1
    @State private var totalRound = 8

    @State private var toReset = false

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)

    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0 ..< 3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            flagImage(country: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)/\(totalRound)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                // Challenge
                Text("Round: \(round)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "False" {
                Text("Wrong! That’s the flag of \(countries[pressedNumber])")
            } else {
                Text("Added one score!")
            }
        }
        .alert("Game over!", isPresented: $toReset) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is: \(userScore)")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "False"
        }

        pressedNumber = number
        showingScore = true
    }

    func askQuestion() {
        round += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        if round > 8 {
            toReset = true
        }
    }

    func resetGame() {
        toReset = false
        round = 1
        userScore = 0
    }

    struct flagImage: View {
        var country: String

        var body: some View {
            Image(country)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
