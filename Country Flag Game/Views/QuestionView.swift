//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Zane Matarieh on 1/9/25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        VStack(spacing: 20, content: {
            if gameManager.playingGame {
                HStack(content: {
                    Text("Country Flag Game")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .foregroundColor(.yellow)
                })
            ProgressBar(progress: gameManager.progress)
            VStack(spacing: 10, content: {
                Text("Which country's flag is this")
                Image(gameManager.country)
                    .resizable()
                    .frame(width: 300, height: 200)
                ForEach(gameManager.answerChoices) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(gameManager)
                }
            })
            Button {
                gameManager.goToNextQuestion()
            } label: {
                CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
            }
            .disabled(!gameManager.answerSelected)
            Spacer()
        }
            else {
                Text("Country FLag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congratulations! You've completed the game!")
                Text("You scored \(gameManager.score) out of \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
        })
        .padding()
        .background(.cyan)
    }
}

#Preview {
    QuestionView()
        .environmentObject(GameManager())
}
