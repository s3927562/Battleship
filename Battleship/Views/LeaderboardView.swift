//
//  LeaaderboardView.swift
//  Battleship
//
//  Created by Tung Tran Thanh on 25/08/2023.
//https://sarunw.com/posts/swiftui-form/
//https://sarunw.com/posts/swiftui-form-picker-styles/

import SwiftUI

struct LeaderboardView: View {
    @State private var selectedDifficulty = "Easy"
    @State private var difficultyHighScore: [Score] = highScores[0].scores
    @State private var difficultyStats: Statistics = stats[0]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Leaderboard", selection: $selectedDifficulty) {
                        ForEach(highScores, id:\.self.difficulty) {
                            Text($0.difficulty)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Difficulty")
                }
                
                Section {
                    ForEach(difficultyHighScore) {
                        if ($0.username == "" && $0.score == 0) {
                            LabeledContent("None", value: "None")
                        } else {
                            LabeledContent($0.username, value: String($0.score))
                        }
                    }
                } header: {
                    Text("Leaderboard")
                }
                
                Section {
                    LabeledContent("Games Total", value: String(difficultyStats.total))
                } header: {
                    Text("Statistics")
                }
            }
        }
        .onChange(of: selectedDifficulty) { _ in
            for difficulty in highScores {
                if difficulty.difficulty == selectedDifficulty {
                    difficultyHighScore = difficulty.scores
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
