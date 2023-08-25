//
//  Difficulty.swift
//  Battleship
//
//  Created by Tung Tran Thanh on 25/08/2023.
//

import Foundation

struct Score: Codable, Identifiable {
    let username: String
    let score: Int
    var id: UUID { UUID() }
}
struct HighScore: Hashable {
    let difficulty: String
    var file: String { "\(difficulty.lowercased()).json" }
    var scores: [Score] {
        if let file = Bundle.main.url(forResource: file, withExtension: nil) {
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([Score].self, from: data)
                    return decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
        } else {
            fatalError("Couldn't load \(file)")
        }
        return [ ] as [Score]
    }
    
    init(_ difficulty: String) {
        self.difficulty = difficulty
    }
}

var highScores: [HighScore] = [HighScore("Easy"), HighScore("Medium"), HighScore("Hard")]
