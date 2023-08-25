//
//  StatisticsData.swift
//  Battleship
//
//  Created by Tung Tran Thanh on 25/08/2023.
//

import Foundation

struct Statistics: Codable {
    let difficulty: String
    let total: Int
    let win: Int
}

var stats: [Statistics] {
    let file = "stats.json"
    if let file = Bundle.main.url(forResource: file, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Statistics].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(file)")
    }
    return [ ] as [Statistics]
}
