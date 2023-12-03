//
//  Game.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 24.11.2023.
//

import Foundation

enum Mode: String, CaseIterable, Codable {
    case Flags, Countries, Capitals
}

enum Level: String, Codable {
    case Easy, Hard
}

struct Country: Codable {
    let level: Level
    var code: String
    var name: String
    var flag: String
    var capital: String
    
    init(level: Level, code: String, name: String, capital: String) {
        self.level = level
        self.code = code.uppercased()
        self.name = name.capitalized
        self.capital = capital.capitalized
        self.flag = ""
        
        for scalar in code.uppercased().unicodeScalars {
            flag.append(String(UnicodeScalar(UInt32(127397) + scalar.value)!))
        }
    }
}

struct GameMode: Codable {
    let ID: Int
    let level: Level
    let mode: Mode
    var healthPoint: Int
    var progressScore: Int
    var bestScore: Int
    var countriesToGuess: [Country]
    
    static func defaultForID(_ ID: Int) -> GameMode {
        GameMode(
            ID: ID,
            level: ID % 2 == 0 ? .Easy : .Hard,
            mode: ID < 2 ? .Flags : ID < 4 ? .Countries : .Capitals,
            healthPoint: 3,
            progressScore: 0,
            bestScore: 0,
            countriesToGuess: Array(repeating: AppRepository.shared.countries.filter {
                $0.level == (ID % 2 == 0 ? .Easy : .Hard)
            }.shuffled(), count: 5).flatMap { $0 }
        )
    }
}
